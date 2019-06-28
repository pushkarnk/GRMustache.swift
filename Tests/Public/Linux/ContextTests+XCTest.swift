import XCTest

extension ContextTests {

   static var allTests : [(String, (ContextTests) -> () throws -> Void)] {
      return [
                ("testContextWithValueConstructor", testContextWithValueConstructor),
                ("testContextWithProtectedObjectConstructor", testContextWithProtectedObjectConstructor),
                ("testContextWithWillRenderFunction", testContextWithWillRenderFunction),
                ("testTopMustacheValue", testTopMustacheValue),
                ("testSubscript", testSubscript),
           ]
   }
}

