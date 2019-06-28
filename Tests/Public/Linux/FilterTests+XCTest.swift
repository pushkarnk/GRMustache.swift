import XCTest

extension FilterTests {

   static var allTests : [(String, (FilterTests) -> () throws -> Void)] {
      return [
                ("testFilterCanChain", testFilterCanChain),
                ("testScopedValueAreExtractedOutOfAFilterExpression", testScopedValueAreExtractedOutOfAFilterExpression),
                ("testFilterArgumentsDoNotEnterSectionContextStack", testFilterArgumentsDoNotEnterSectionContextStack),
                ("testFilterNameSpace", testFilterNameSpace),
                ("testFilterCanReturnFilter", testFilterCanReturnFilter),
                ("testImplicitIteratorCanReturnFilter", testImplicitIteratorCanReturnFilter),
                ("testMissingFilterError", testMissingFilterError),
                ("testNotAFilterError", testNotAFilterError),
                ("testMissingFilterErrorDescriptionContainsLineNumber", testMissingFilterErrorDescriptionContainsLineNumber),
                ("testMissingFilterErrorDescriptionContainsTemplatePath", testMissingFilterErrorDescriptionContainsTemplatePath),
                ("testNotAFilterErrorDescriptionContainsLineNumber", testNotAFilterErrorDescriptionContainsLineNumber),
                ("testNotAFilterErrorDescriptionContainsTemplatePath", testNotAFilterErrorDescriptionContainsTemplatePath),
                ("testFilterOfOptionalInt", testFilterOfOptionalInt),
                ("testFilterOfOptionalString", testFilterOfOptionalString),
                ("testFilterCanThrowMustacheError", testFilterCanThrowMustacheError),
                ("testFilterCanThrowCustomNSError", testFilterCanThrowCustomNSError),
                ("testFilterCanThrowCustomError", testFilterCanThrowCustomError),
           ]
   }
}

