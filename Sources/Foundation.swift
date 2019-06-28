import Foundation

private func BoxAny(_ object: Any?) -> MustacheBox {
    guard let object = object else {
        return Box(nil)
    }

    if let boxable = object as? MustacheBoxable {
        return boxable.mustacheBox
    }

    let mirror = Mirror(reflecting: object)
    if mirror.displayStyle == .collection {
        var array = [Any]()
        for (_, element) in mirror.children {
            array.append(element)
        }
        return Box(array)
    }

    if mirror.displayStyle == .set {
        let `set` = NSMutableSet() // do not use Set<Any> since Any is not hashable
        for (_, element) in mirror.children {
            set.add(BoxAny(element))
        }
        return Box(set)
    }

    // hanlde Optionals and other enums
    if mirror.displayStyle == .`enum` || mirror.displayStyle == .optional {
        for (_, element) in mirror.children {
            return BoxAny(element)
        }
    }

    if mirror.displayStyle == .dictionary  {
        var resultDictionary = [String: Any]()
        for (_, element) in mirror.children {
            let elementMirror = Mirror(reflecting: element)
            if elementMirror.displayStyle == .tuple {
                if let key = elementMirror.descendant(0) as? String, let value = elementMirror.descendant(1) {
                    resultDictionary[key] = value
                }
            }
        }
        return Box(resultDictionary)
    }
    //
    // Yet we can not prevent the user from trying to box it, because the
    // Thing class adopts the Any protocol, just as all Swift classes.
    //
    //     class Thing { }
    //
    //     // Compilation error (OK): cannot find an overload for 'Box' that accepts an argument list of type '(Thing)'
    //     Box(Thing())
    //
    //     // Runtime warning (Not OK but unavoidable): value `Thing` is not NSObject and does not conform to MustacheBoxable: it is discarded.
    //     BoxAny(Thing())
    //
    //     // Foundation collections can also contain unsupported classes:
    //     let array = NSArray(object: Thing())
    //
    //     // Runtime warning (Not OK but unavoidable): value `Thing` is not NSObject and does not conform to MustacheBoxable: it is discarded.
    //     Box(array)
    //
    //     // Compilation error (OK): cannot find an overload for 'Box' that accepts an argument list of type '(Any)'
    //     Box(array[0])
    //
    //     // Runtime warning (Not OK but unavoidable): value `Thing` is not NSObject and does not conform to MustacheBoxable: it is discarded.
    //     BoxAny(array[0])

    NSLog("Mustache.BoxAny(): value `\(object)` does not conform to MustacheBoxable and cannot be boxed: it is discarded.")
    return Box(nil) 
}

/// GRMustache provides built-in support for rendering `NSObject`.
extension NSObject : MustacheBoxable {
    
    /// `NSObject` adopts the `MustacheBoxable` protocol so that it can feed
    /// Mustache templates.
    ///
    /// You should not directly call the `mustacheBox` property.
    ///
    ///
    /// NSObject's default implementation handles two general cases:
    ///
    /// - Enumerable objects that conform to the `NSFastEnumeration` protocol,
    ///   such as `NSArray` and `NSOrderedSet`.
    /// - All other objects
    ///
    /// GRMustache ships with a few specific classes that escape the general
    /// cases and provide their own rendering behavior: `NSDictionary`,
    /// `NSFormatter`, `NSNull`, `NSNumber`, `NSString`, and `NSSet` (see the
    /// documentation for those classes).
    ///
    /// Your own subclasses of NSObject can also override the `mustacheBox`
    /// method and provide their own custom behavior.
    ///
    ///
    /// ## Arrays
    ///
    /// An object is treated as an array if it conforms to `NSFastEnumeration`.
    /// This is the case of `NSArray` and `NSOrderedSet`, for example.
    /// `NSDictionary` and `NSSet` have their own custom Mustache rendering: see
    /// their documentation for more information.
    ///
    ///
    /// ### Rendering
    ///
    /// - `{{array}}` renders the concatenation of the renderings of the
    ///   array items.
    ///
    /// - `{{#array}}...{{/array}}` renders as many times as there are items in
    ///   `array`, pushing each item on its turn on the top of the
    ///   context stack.
    ///
    /// - `{{^array}}...{{/array}}` renders if and only if `array` is empty.
    ///
    ///
    /// ### Keys exposed to templates
    ///
    /// An array can be queried for the following keys:
    ///
    /// - `count`: number of elements in the array
    /// - `first`: the first object in the array
    /// - `last`: the last object in the array
    ///
    /// Because 0 (zero) is falsey, `{{#array.count}}...{{/array.count}}`
    /// renders once, if and only if `array` is not empty.
    ///
    ///
    /// ## Other objects
    ///
    /// Other objects fall in the general case.
    ///
    /// Their keys are extracted with the `valueForKey:` method, as long as the
    /// key is a property name, a custom property getter, or the name of a
    /// `NSManagedObject` attribute.
    ///
    ///
    /// ### Rendering
    ///
    /// - `{{object}}` renders the result of the `description` method,
    ///   HTML-escaped.
    ///
    /// - `{{{object}}}` renders the result of the `description` method, *not*
    ///   HTML-escaped.
    ///
    /// - `{{#object}}...{{/object}}` renders once, pushing `object` on the top
    ///   of the context stack.
    ///
    /// - `{{^object}}...{{/object}}` does not render.
    public var mustacheBox: MustacheBox {
        #if os(Linux)
        if self is MustacheBox {
            return self as! MustacheBox
        } else if self is NSArray {
            return handleEnumeration(self)
        } else if self is Formatter {
            return handleFormatter(self)
        } else if self is NSNumber {
            return handleNSNumber(self)
        }
        return MustacheBox(value: self)
        #else
        if let enumerable = self as? NSFastEnumeration {
            // Enumerable
            
            // Turn enumerable into a Swift array that we know how to box
            return Box(Array(IteratorSequence(NSFastEnumerationIterator(enumerable))))
            
        } else {
            // Generic NSObject
            
            #if OBJC
                return MustacheBox(
                    value: self,
                    keyedSubscript: { (key: String) in
                        if GRMustacheKeyAccess.isSafeMustacheKey(key, for: self) {
                            // Use valueForKey: for safe keys
                            return self.value(forKey: key)
                        } else {
                            // Missing key
                            return Box(nil) 
                        }
                })
            #else
                return MustacheBox(value: self)
            #endif
        }
        #endif
    }

    private func handleEnumeration(_ object: NSObject?) -> MustacheBox {
        var selfArray = [Any]()
        if let nsArray = object as? NSArray {
            selfArray = nsArray._bridgeToSwift()
        } else if let orderedSet = object as? NSOrderedSet {
            // NSOrderedSet.array is not implemented yet
            for element in orderedSet {
                selfArray.append(element)
            }
        }
        let array = selfArray.map(BoxAny)
        return array.mustacheBox(withArrayValue: object, box: { $0 })
    }


    private func handleNonEnumerationObject(_ object: NSObject?) -> MustacheBox {
        // Generic NSObject
        guard let object = object else {
            return Box(nil) 
        }
        return MustacheBox(value: object)
    }

    private func handleFormatter(_ formatterObject: NSObject) -> MustacheBox {
        // Return a multi-facetted box, because NSFormatter interacts in
        // various ways with Mustache rendering.
        
        return MustacheBox(
            // Let user extract the formatter out of the box:
            value: formatterObject,
            
            // This function is used for evaluating `formatter(x)` expressions.
            filter: Filter { (box: MustacheBox) in
                // NSFormatter documentation for stringForObjectValue: states:
                //
                // > First test the passed-in object to see if it’s of the
                // > correct class. If it isn’t, return nil; but if it is of the
                // > right class, return a properly formatted and, if necessary,
                // > localized string.
                if let object = box.value as? NSObject {
                    return (formatterObject as! Formatter).string(for: object)
                } else {
                    // Not the correct class: return nil, i.e. empty Box.
                    return nil
                }
            },
            
            // This function lets formatter change values that are about to be
            // rendered to their formatted counterpart.
            //
            // It is activated as soon as the formatter enters the context
            // stack, when used in a section `{{# formatter }}...{{/ formatter }}`.
            willRender: { (tag: Tag, box: MustacheBox) in
                switch tag.type {
                case .variable:
                    // {{ value }}
                    // Format the value if we can.
                    //
                    // NSFormatter documentation for stringForObjectValue: states:
                    //
                    // > First test the passed-in object to see if it’s of the correct
                    // > class. If it isn’t, return nil; but if it is of the right class,
                    // > return a properly formatted and, if necessary, localized string.
                    //
                    // So nil result means that object is not of the correct class. Leave
                    // it untouched.
                    
                    if let formatted = (formatterObject as! Formatter).string(for: box.value) {
                        return formatted
                    } else {
                        return box
                    }
                    
                case .section:
                    // {{# value }}...{{/ value }}
                    // {{^ value }}...{{/ value }}
                    // Leave sections untouched, so that loops and conditions are not
                    // affected by the formatter.
                    
                    return box
                }
        })
    }

    private func handleNSNumber(_ object: NSObject) -> MustacheBox {
        let nsNumber = object as! NSNumber
        let objCType = String(cString: nsNumber.objCType)
        switch objCType {
        case "c":
            return Box(Int(nsNumber.int8Value))
        case "C":
            return Box(UInt(nsNumber.uint8Value))
        case "s":
            return Box(Int(nsNumber.int16Value))
        case "S":
            return Box(UInt(nsNumber.uint16Value))
        case "i":
            return Box(Int(nsNumber.int32Value))
        case "I":
            return Box(UInt(nsNumber.uint32Value))
        case "l":
            return Box(nsNumber.intValue)
        case "L":
            return Box(nsNumber.uintValue)
        case "q":
            return Box(nsNumber.int64Value)
        case "Q":
            return Box(nsNumber.uint64Value)
        case "f":
            return Box(nsNumber.floatValue)
        case "d":
            return Box(nsNumber.doubleValue)
        case "B":
            return Box(nsNumber.boolValue)
        default:
            return Box(nsNumber)
        }
    }
}

/// GRMustache provides built-in support for rendering `NSSet`.
#if !os(Linux)
extension NSSet {
    
    /// `NSSet` adopts the `MustacheBoxable` protocol so that it can feed
    /// Mustache templates.
    ///
    ///     let set: NSSet = [1,2,3]
    ///
    ///     // Renders "213"
    ///     let template = try! Template(string: "{{#set}}{{.}}{{/set}}")
    ///     try! template.render(Box(["set": Box(set)]))
    ///
    ///
    /// You should not directly call the `mustacheBox` property.
    ///
    /// ### Rendering
    ///
    /// - `{{set}}` renders the concatenation of the renderings of the set
    ///   items, in any order.
    ///
    /// - `{{#set}}...{{/set}}` renders as many times as there are items in
    ///   `set`, pushing each item on its turn on the top of the context stack.
    ///
    /// - `{{^set}}...{{/set}}` renders if and only if `set` is empty.
    ///
    ///
    /// ### Keys exposed to templates
    ///
    /// A set can be queried for the following keys:
    ///
    /// - `count`: number of elements in the set
    /// - `first`: the first object in the set
    ///
    /// Because 0 (zero) is falsey, `{{#set.count}}...{{/set.count}}` renders
    /// once, if and only if `set` is not empty.
    func handleNSSet(_ object: NSObject) -> MustacheBox {
        return Box(Set(IteratorSequence(NSFastEnumerationIterator(self)).compactMap { $0 as? AnyHashable }))
    }


}

/// GRMustache provides built-in support for rendering `NSNull`.
extension NSNull {
    
    /// `NSNull` adopts the `MustacheBoxable` protocol so that it can feed
    /// Mustache templates.
    ///
    /// You should not directly call the `mustacheBox` property. Always use the
    /// `Box()` function instead:
    ///
    ///     NSNull().mustacheBox   // Valid, but discouraged
    ///     Box(NSNull())          // Preferred
    ///
    ///
    /// ### Rendering
    ///
    /// - `{{null}}` does not render.
    ///
    /// - `{{#null}}...{{/null}}` does not render (NSNull is falsey).
    ///
    /// - `{{^null}}...{{/null}}` does render (NSNull is falsey).
    @objc open override var mustacheBox: MustacheBox {
        return MustacheBox(
            value: self,
            boolValue: false,
            render: { (info: RenderingInfo) in return Rendering("") })
    }
}


/// GRMustache provides built-in support for rendering `NSNumber`.
extension NSNumber {
    
    /// `NSNumber` adopts the `MustacheBoxable` protocol so that it can feed
    /// Mustache templates.
    ///
    /// You should not directly call the `mustacheBox` property.
    ///
    ///
    /// ### Rendering
    ///
    /// NSNumber renders exactly like Swift numbers: depending on its internal
    /// objCType, an NSNumber is rendered as a Swift Bool, Int, UInt, Int64,
    /// UInt64, or Double.
    ///
    /// - `{{number}}` is rendered with built-in Swift String Interpolation.
    ///   Custom formatting can be explicitly required with NumberFormatter,
    ///   as in `{{format(a)}}` (see `Formatter`).
    ///
    /// - `{{#number}}...{{/number}}` renders if and only if `number` is
    ///   not 0 (zero).
    ///
    /// - `{{^number}}...{{/number}}` renders if and only if `number` is 0 (zero).
    ///
    @objc open override var mustacheBox: MustacheBox {
        
        let objCType = String(cString: self.objCType)
        switch objCType {
        case "c":
            return Box(Int(int8Value))
        case "C":
            return Box(UInt(uint8Value))
        case "s":
            return Box(Int(int16Value))
        case "S":
            return Box(UInt(uint16Value))
        case "i":
            return Box(Int(int32Value))
        case "I":
            return Box(UInt(uint32Value))
        case "l":
            return Box(intValue)
        case "L":
            return Box(uintValue)
        case "q":
            return Box(int64Value)
        case "Q":
            return Box(uint64Value)
        case "f":
            return Box(floatValue)
        case "d":
            return Box(doubleValue)
        case "B":
            return Box(boolValue)
        default:
            return Box(self)
        }
    }
}


/// GRMustache provides built-in support for rendering `NSString`.
extension NSString {
    
    /// `NSString` adopts the `MustacheBoxable` protocol so that it can feed
    /// Mustache templates.
    ///
    /// You should not directly call the `mustacheBox` property.
    ///
    ///
    /// ### Rendering
    ///
    /// - `{{string}}` renders the string, HTML-escaped.
    ///
    /// - `{{{string}}}` renders the string, *not* HTML-escaped.
    ///
    /// - `{{#string}}...{{/string}}` renders if and only if `string` is
    ///   not empty.
    ///
    /// - `{{^string}}...{{/string}}` renders if and only if `string` is empty.
    ///
    /// HTML-escaping of `{{string}}` tags is disabled for Text templates: see
    /// `Configuration.contentType` for a full discussion of the content type of
    /// templates.
    ///
    ///
    /// ### Keys exposed to templates
    ///
    /// A string can be queried for the following keys:
    ///
    /// - `length`: the number of characters in the string (using Swift method).
    //@objc open override var mustacheBox: MustacheBox {
    //    return Box(self as String)
    //}
}


/// GRMustache provides built-in support for rendering `NSSet`.
extension NSSet {
    
    /// `NSSet` adopts the `MustacheBoxable` protocol so that it can feed
    /// Mustache templates.
    ///
    ///     let set: NSSet = [1,2,3]
    ///
    ///     // Renders "213"
    ///     let template = try! Template(string: "{{#set}}{{.}}{{/set}}")
    ///     try! template.render(Box(["set": Box(set)]))
    ///
    ///
    /// You should not directly call the `mustacheBox` property.
    ///
    /// ### Rendering
    ///
    /// - `{{set}}` renders the concatenation of the renderings of the set
    ///   items, in any order.
    ///
    /// - `{{#set}}...{{/set}}` renders as many times as there are items in
    ///   `set`, pushing each item on its turn on the top of the context stack.
    ///
    /// - `{{^set}}...{{/set}}` renders if and only if `set` is empty.
    ///
    ///
    /// ### Keys exposed to templates
    ///
    /// A set can be queried for the following keys:
    ///
    /// - `count`: number of elements in the set
    /// - `first`: the first object in the set
    ///
    /// Because 0 (zero) is falsey, `{{#set.count}}...{{/set.count}}` renders
    /// once, if and only if `set` is not empty.
    @objc open override var mustacheBox: MustacheBox {
        return Box(Set(IteratorSequence(NSFastEnumerationIterator(self)).compactMap { $0 as? AnyHashable }))
    }
}


/// GRMustache provides built-in support for rendering `NSDictionary`.
extension NSDictionary {
    
    /// `NSDictionary` adopts the `MustacheBoxable` protocol so that it can feed
    /// Mustache templates.
    ///
    ///     // Renders "Freddy Mercury"
    ///     let dictionary: NSDictionary = [
    ///         "firstName": "Freddy",
    ///         "lastName": "Mercury"]
    ///     let template = try! Template(string: "{{firstName}} {{lastName}}")
    ///     let rendering = try! template.render(Box(dictionary))
    ///
    ///
    /// You should not directly call the `mustacheBox` property.
    ///
    ///
    /// ### Rendering
    ///
    /// - `{{dictionary}}` renders the result of the `description` method,
    ///   HTML-escaped.
    ///
    /// - `{{{dictionary}}}` renders the result of the `description` method,
    ///   *not* HTML-escaped.
    ///
    /// - `{{#dictionary}}...{{/dictionary}}` renders once, pushing `dictionary`
    ///   on the top of the context stack.
    ///
    /// - `{{^dictionary}}...{{/dictionary}}` does not render.
    ///
    ///
    /// In order to iterate over the key/value pairs of a dictionary, use the
    /// `each` filter from the Standard Library:
    ///
    ///     // Attach StandardLibrary.each to the key "each":
    ///     let template = try! Template(string: "<{{# each(dictionary) }}{{@key}}:{{.}}, {{/}}>")
    ///     template.register(StandardLibrary.each, forKey: "each")
    ///
    ///     // Renders "<name:Arthur, age:36, >"
    ///     let dictionary = ["name": "Arthur", "age": 36] as NSDictionary
    ///     let rendering = try! template.render(["dictionary": dictionary])
    @objc open override var mustacheBox: MustacheBox {
        return Box(self as? [AnyHashable: Any])
    }
}

/*extension Dictionary: MustacheBoxable {
    public var mustacheBox: MustacheBox {
        return MustacheBox(
                converter: MustacheBox.Converter(
                               dictionaryValue: self.reduce([String: MustacheBox]()) { (boxDictionary, item: (key: Key, value: Value)) in
                                   var boxDictionary = boxDictionary
                                   guard let key = item.key as? String else {
                                       NSLog("GRMustache found a non-String key in Dictionary (\(item.key)): value is discarded.")
                                       return boxDictionary
                                   }
                                   boxDictionary[key] = BoxAny(item.value)
                                   return boxDictionary
                               }),
                value: self,
                keyedSubscript: { (key: String) in
                    guard let typedKey = key as? Key else {
                        NSLog("GRMustache cannot use \(key) as a key in Dictionary : returning empty box.")
                        return Box(nil)
                    }
                    if let value = self[typedKey] {
                        return BoxAny(value)
                    } else {
                        return Box(nil)
                    }
                })
    }
}
#endif

/// Support for Mustache rendering of ReferenceConvertible types.
extension ReferenceConvertible where Self: MustacheBoxable {
    /// Returns a MustacheBox that behaves like the equivalent NSObject.
    ///
    /// See NSObject.mustacheBox
    public var mustacheBox: MustacheBox {
        return (self as! ReferenceType).mustacheBox
    }
}

/// Data can feed Mustache templates.
extension Data : MustacheBoxable { }

/// Date can feed Mustache templates.
extension Date : MustacheBoxable { }

/// URL can feed Mustache templates.
extension URL : MustacheBoxable { }

/// UUID can feed Mustache templates.
extension UUID : MustacheBoxable { }

// Support for Array
extension BidirectionalCollection {
    /**
    This function returns a MustacheBox that wraps an array-like collection.

    The returned box can be queried for the following keys:

    - `first`: the first object in the collection
    - `count`: number of elements in the collection
    - `last`: the last object in the collection

    - parameter value: the value of the returned box.
    - parameter box:   A closure that turns collection items into a MustacheBox.
                       It makes us able to provide a single implementation
                       whatever the type of the collection items.
    - returns: A MustacheBox that wraps the collection.
    */
    func mustacheBox(withArrayValue value: Any?, box: @escaping (Iterator.Element) -> MustacheBox) -> MustacheBox {
        return MustacheBox(
            converter: MustacheBox.Converter(arrayValue:  { self.map{ box($0) } }),
            value: value,
            boolValue: !isEmpty,
            keyedSubscript: { (key) in
                switch key {
                case "first":   // C: Collection
                    if let first = self.first {
                        return box(first)
                    } else {
                        return Box(nil)
                    }
                case "last":    // C.Index: BidirectionalIndex
                    if let last = self.last {
                        return box(last)
                    } else {
                        return Box(nil)
                    }
                case "count":   // C.IndexDistance == Int
                    return Box(self.count)
                default:
                    return Box(nil)
                }
            },
            render: { (info: RenderingInfo) in
                if info.enumerationItem {
                    // {{# collections }}...{{/ collections }}
                    return try info.tag.render(info.context.extendedContext(self.mustacheBox(withArrayValue: value, box: box)))
                } else {
                    // {{ collection }}
                    // {{# collection }}...{{/ collection }}
                    return try self.renderItems(info: info, box: box)
                }
            }
        )
    }
}

// Support for all collections
extension Collection {

    /**
    Concatenates the rendering of the collection items.

    There are two tricks when rendering collections:

    1. Items can render as Text or HTML, and our collection should render with
       the same type. It is an error to mix content types.

    2. We have to tell items that they are rendered as an enumeration item.
       This allows collections to avoid enumerating their items when they are
       part of another collections:

            {{# arrays }}  // Each array renders as an enumeration item, and has itself enter the context stack.
              {{#.}}       // Each array renders "normally", and enumerates its items
                ...
              {{/.}}
            {{/ arrays }}

    - parameter info: A RenderingInfo
    - parameter box: A closure that turns collection items into a MustacheBox.
                     It makes us able to provide a single implementation
                     whatever the type of the collection items.
    - returns: A Rendering
    */
    func renderItems(info: RenderingInfo, box: (Iterator.Element) -> MustacheBox) throws -> Rendering {
        // Prepare the rendering. We don't known the contentType yet: it depends on items
        var buffer = ""
        var contentType: ContentType? = nil

        // Tell items they are rendered as an enumeration item.
        //
        // Some values don't render the same whenever they render as an
        // enumeration item, or alone: {{# values }}...{{/ values }} vs.
        // {{# value }}...{{/ value }}.
        //
        // This is the case of Int, UInt, Double, Bool: they enter the context
        // stack when used in an iteration, and do not enter the context stack
        // when used as a boolean.
        //
        // This is also the case of collections: they enter the context stack
        // when used as an item of a collection, and enumerate their items when
        // used as a collection.
        var info = info
        info.enumerationItem = true

        for item in self {
            let boxRendering = try box(item).render(info)
            if contentType == nil
            {
                // First item: now we know our contentType
                contentType = boxRendering.contentType
                buffer += boxRendering.string
            }
            else if contentType == boxRendering.contentType
            {
                // Consistent content type: keep on buffering.
                buffer += boxRendering.string
            }
            else
            {
                // Inconsistent content type: this is an error. How are we
                // supposed to mix Text and HTML?
                throw MustacheError(kind: .renderError, message: "Content type mismatch")
            }
        }

        if let contentType = contentType {
            // {{ collection }}
            // {{# collection }}...{{/ collection }}
            //
            // We know our contentType, hence the collection is not empty and
            // we render our buffer.
            return Rendering(buffer, contentType)
        } else {
            // {{ collection }}
            //
            // We don't know our contentType, hence the collection is empty.
            //
            // Now this code is executed. This means that the collection is
            // rendered, despite its emptiness.
            //
            // We are not rendering a regular {{# section }} tag, because empty
            // collections have a false boolValue, and RenderingEngine would prevent
            // us to render.
            //
            // We are not rendering an inverted {{^ section }} tag, because
            // RenderingEngine takes care of the rendering of inverted sections.
            //
            // So we are rendering a {{ variable }} tag. As en empty collection, we
            // must return an empty rendering.
            //
            // Renderings have a content type. In order to render an empty
            // rendering that has the contentType of the tag, let's use the
            // `render` method of the tag.
            return try info.tag.render(info.context)
        }
    }
}
