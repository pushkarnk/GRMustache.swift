import XCTest

extension TemplateRepositoryPathTests {

   static var allTests : [(String, (TemplateRepositoryPathTests) -> () throws -> Void)] {
      return [
                ("testTemplateRepositoryWithURL", testTemplateRepositoryWithURL),
                ("testTemplateRepositoryWithURLTemplateExtensionEncoding", testTemplateRepositoryWithURLTemplateExtensionEncoding),
                ("testAbsolutePartialName", testAbsolutePartialName),
                ("testPartialNameCanNotEscapeTemplateRepositoryRootDirectory", testPartialNameCanNotEscapeTemplateRepositoryRootDirectory),
           ]
   }
}

