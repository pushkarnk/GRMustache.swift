import XCTest

extension TemplateRepositoryDictionaryTests {

   static var allTests : [(String, (TemplateRepositoryDictionaryTests) -> () throws -> Void)] {
      return [
                ("testTemplateRepositoryWithDictionary", testTemplateRepositoryWithDictionary),
                ("testTemplateRepositoryWithDictionaryIgnoresDictionaryMutation", testTemplateRepositoryWithDictionaryIgnoresDictionaryMutation),
           ]
   }
}

