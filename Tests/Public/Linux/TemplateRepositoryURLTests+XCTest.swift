import XCTest

extension TemplateRepositoryURLTests {

   static var allTests : [(String, (TemplateRepositoryURLTests) -> () throws -> Void)] {
      return [
                ("testTemplateRepositoryWithURL", testTemplateRepositoryWithURL),
                ("testTemplateRepositoryWithURLTemplateExtensionEncoding", testTemplateRepositoryWithURLTemplateExtensionEncoding),
                ("testAbsolutePartialName", testAbsolutePartialName),
                ("testPartialNameCanNotEscapeTemplateRepositoryRootURL", testPartialNameCanNotEscapeTemplateRepositoryRootURL),
           ]
   }
}

