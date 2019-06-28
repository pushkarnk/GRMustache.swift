import XCTest

extension TemplateTests {

   static var allTests : [(String, (TemplateTests) -> () throws -> Void)] {
      return [
                ("testTemplateBelongsToItsOriginTemplateRepository", testTemplateBelongsToItsOriginTemplateRepository),
                ("testTemplateExtendBaseContextWithValue", testTemplateExtendBaseContextWithValue),
                ("testTemplateExtendBaseContextWithProtectedValue", testTemplateExtendBaseContextWithProtectedValue),
                ("testTemplateExtendBaseContextWithWillRenderFunction", testTemplateExtendBaseContextWithWillRenderFunction),
           ]
   }
}

