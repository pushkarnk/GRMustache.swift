import XCTest

extension ContextRegisteredKeyTests {

   static var allTests : [(String, (ContextRegisteredKeyTests) -> () throws -> Void)] {
      return [
                ("testRegisteredKeyCanBeAccessed", testRegisteredKeyCanBeAccessed),
                ("testMultipleRegisteredKeysCanBeAccessed", testMultipleRegisteredKeysCanBeAccessed),
                ("testRegisteredKeysCanNotBeShadowed", testRegisteredKeysCanNotBeShadowed),
                ("testDeepRegisteredKeyCanBeAccessedViaFullKeyPath", testDeepRegisteredKeyCanBeAccessedViaFullKeyPath),
                ("testDeepRegisteredKeyCanBeAccessedViaScopedExpression", testDeepRegisteredKeyCanBeAccessedViaScopedExpression),
                ("testDeepRegisteredKeyCanBeShadowed", testDeepRegisteredKeyCanBeShadowed),
           ]
   }
}

