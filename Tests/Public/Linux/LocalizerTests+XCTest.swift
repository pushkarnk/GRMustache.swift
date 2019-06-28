import XCTest

extension LocalizerTests {

   static var allTests : [(String, (LocalizerTests) -> () throws -> Void)] {
      return [
                ("testLocalizableBundle", testLocalizableBundle),
                ("testLocalizer", testLocalizer),
                ("testLocalizerFromTable", testLocalizerFromTable),
                ("testLocalizerAsRenderingObjectWithoutArgumentDoesNotNeedPercentEscapedLocalizedString", testLocalizerAsRenderingObjectWithoutArgumentDoesNotNeedPercentEscapedLocalizedString),
                ("testLocalizerAsRenderingObjectWithoutArgumentNeedsPercentEscapedLocalizedString", testLocalizerAsRenderingObjectWithoutArgumentNeedsPercentEscapedLocalizedString),
                ("testLocalizerAsFilter", testLocalizerAsFilter),
                ("testLocalizerAsRenderable", testLocalizerAsRenderable),
                ("testLocalizerAsRenderableWithArgument", testLocalizerAsRenderableWithArgument),
                ("testLocalizerAsRenderableWithArgumentAndConditions", testLocalizerAsRenderableWithArgumentAndConditions),
                ("testLocalizerRendersHTMLEscapedValuesOfHTMLTemplates", testLocalizerRendersHTMLEscapedValuesOfHTMLTemplates),
                ("testLocalizerRendersUnescapedValuesOfTextTemplates", testLocalizerRendersUnescapedValuesOfTextTemplates),
           ]
   }
}

