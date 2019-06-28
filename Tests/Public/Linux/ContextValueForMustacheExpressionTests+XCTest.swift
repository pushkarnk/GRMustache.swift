import XCTest

extension ContextValueForMustacheExpressionTests {

   static var allTests : [(String, (ContextValueForMustacheExpressionTests) -> () throws -> Void)] {
      return [
                ("testImplicitIteratorExpression", testImplicitIteratorExpression),
                ("testIdentifierExpression", testIdentifierExpression),
                ("testScopedExpression", testScopedExpression),
                ("testFilteredExpression", testFilteredExpression),
                ("testParseError", testParseError),
                ("testRenderError", testRenderError),
           ]
   }
}

