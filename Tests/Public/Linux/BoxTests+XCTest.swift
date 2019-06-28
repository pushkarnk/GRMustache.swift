import XCTest

extension BoxTests {

   static var allTests : [(String, (BoxTests) -> () throws -> Void)] {
      return [
                ("testInt", testInt),
                ("testCustomBoxable", testCustomBoxable),
                ("testOptionalInt", testOptionalInt),
                ("testOptionalMustacheBoxable", testOptionalMustacheBoxable),
                ("testSetOfInt", testSetOfInt),
                ("testSetOfCustomHashableBoxable", testSetOfCustomHashableBoxable),
                ("testDictionaryOfStringInt", testDictionaryOfStringInt),
                ("testDictionaryOfStringCustomBoxable", testDictionaryOfStringCustomBoxable),
                ("testDictionaryOfStringOptionalInt", testDictionaryOfStringOptionalInt),
                ("testDictionaryOfStringOptionalCustomBoxable", testDictionaryOfStringOptionalCustomBoxable),
                ("testDictionaryOfStringAny", testDictionaryOfStringAny),
                ("testDictionaryOfStringOptionalAny", testDictionaryOfStringOptionalAny),
                ("testDictionaryOfAnyHashableAny", testDictionaryOfAnyHashableAny),
                ("testDictionaryOfArray", testDictionaryOfArray),
                ("testDictionaryOfDictionary", testDictionaryOfDictionary),
                ("testDictionaryOfAnyHashableOptionalAny", testDictionaryOfAnyHashableOptionalAny),
                ("testArrayOfInt", testArrayOfInt),
                ("testArrayOfCustomBoxable", testArrayOfCustomBoxable),
                ("testArrayOfOptionalInt", testArrayOfOptionalInt),
                ("testArrayOfOptionalCustomBoxable", testArrayOfOptionalCustomBoxable),
                ("testArrayOfAny", testArrayOfAny),
                ("testArrayOfArray", testArrayOfArray),
                ("testArrayOfDictionary", testArrayOfDictionary),
                ("testArrayOfOptionalAny", testArrayOfOptionalAny),
                ("testNSArrayOfInt", testNSArrayOfInt),
                //("testNSArrayOfMustacheBoxable", testNSArrayOfMustacheBoxable),
                ("testRange", testRange),
           ]
   }
}

