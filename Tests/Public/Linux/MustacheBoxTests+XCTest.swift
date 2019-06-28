import XCTest

extension MustacheBoxTests {

   static var allTests : [(String, (MustacheBoxTests) -> () throws -> Void)] {
      return [
                ("testBoolValue", testBoolValue),
                ("testBoolBoxing", testBoolBoxing),
           ]
   }
}

