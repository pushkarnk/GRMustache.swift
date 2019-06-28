import XCTest

extension TemplateRepositoryTests {

   static var allTests : [(String, (TemplateRepositoryTests) -> () throws -> Void)] {
      return [
                ("testTemplateRepositoryWithoutDataSourceCanNotLoadPartialTemplate", testTemplateRepositoryWithoutDataSourceCanNotLoadPartialTemplate),
                ("testTemplateRepositoryWithoutDataSourceCanLoadStringTemplate", testTemplateRepositoryWithoutDataSourceCanLoadStringTemplate),
                ("testTemplateInstancesAreNotReused", testTemplateInstancesAreNotReused),
                ("testReloadTemplates", testReloadTemplates),
           ]
   }
}

