import XCTest

extension TemplateRepositoryBundleTests {

   static var allTests : [(String, (TemplateRepositoryBundleTests) -> () throws -> Void)] {
      return [
                ("testTemplateRepositoryWithBundle", testTemplateRepositoryWithBundle),
                ("testTemplateRepositoryWithBundleTemplateExtensionEncoding", testTemplateRepositoryWithBundleTemplateExtensionEncoding),
           ]
   }
}

