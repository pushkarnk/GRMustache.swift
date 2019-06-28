import XCTest

extension StandardLibraryTests {

   static var allTests : [(String, (StandardLibraryTests) -> () throws -> Void)] {
      return [
                ("testStandardLibraryHTMLEscapeDoesEscapeText", testStandardLibraryHTMLEscapeDoesEscapeText),
                ("testStandardLibraryHTMLEscapeDoesEscapeHTML", testStandardLibraryHTMLEscapeDoesEscapeHTML),
                ("testStandardLibraryJavascriptEscapeDoesEscapeRenderFunction", testStandardLibraryJavascriptEscapeDoesEscapeRenderFunction),
                ("testStandardLibraryURLEscapeDoesEscapeRenderFunctions", testStandardLibraryURLEscapeDoesEscapeRenderFunctions),
           ]
   }
}

