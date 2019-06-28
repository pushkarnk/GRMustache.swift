import XCTest

extension TagTests {

   static var allTests : [(String, (TagTests) -> () throws -> Void)] {
      return [
                ("testTagDescriptionContainsTagToken", testTagDescriptionContainsTagToken),
                ("testTagDescriptionContainsLineNumber", testTagDescriptionContainsLineNumber),
                ("testTagDescriptionContainsResourceBasedTemplatePath", testTagDescriptionContainsResourceBasedTemplatePath),
                ("testTagDescriptionContainsURLBasedTemplatePath", testTagDescriptionContainsURLBasedTemplatePath),
                ("testTagDescriptionContainsPathBasedTemplatePath", testTagDescriptionContainsPathBasedTemplatePath),
                ("testTagDescriptionContainsResourceBasedPartialPath", testTagDescriptionContainsResourceBasedPartialPath),
                ("testTagDescriptionContainsURLBasedPartialPath", testTagDescriptionContainsURLBasedPartialPath),
                ("testTagDescriptionContainsPathBasedPartialPath", testTagDescriptionContainsPathBasedPartialPath),
           ]
   }
}

