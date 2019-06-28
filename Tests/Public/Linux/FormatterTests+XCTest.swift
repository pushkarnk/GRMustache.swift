import XCTest

extension FormatterTests {

   static var allTests : [(String, (FormatterTests) -> () throws -> Void)] {
      return [
                ("testFormatterIsAFilterForProcessableValues", testFormatterIsAFilterForProcessableValues),
                ("testFormatterIsAFilterForUnprocessableValues", testFormatterIsAFilterForUnprocessableValues),
                ("testFormatterSectionFormatsInnerVariableTags", testFormatterSectionFormatsInnerVariableTags),
                ("testFormatterSectionDoesNotFormatUnprocessableInnerVariableTags", testFormatterSectionDoesNotFormatUnprocessableInnerVariableTags),
                ("testFormatterAsSectionFormatsDeepInnerVariableTags", testFormatterAsSectionFormatsDeepInnerVariableTags),
                ("testFormatterAsSectionDoesNotFormatInnerSectionTags", testFormatterAsSectionDoesNotFormatInnerSectionTags),
                ("testFormatterIsTruthy", testFormatterIsTruthy),
                ("testFormatterRendersSelfAsSomething", testFormatterRendersSelfAsSomething),
                ("testNumberFormatterRendersNothingForMissingValue", testNumberFormatterRendersNothingForMissingValue),
                ("testNumberFormatterRendersNothingForNSNull", testNumberFormatterRendersNothingForNSNull),
                ("testNumberFormatterRendersNothingForNSString", testNumberFormatterRendersNothingForNSString),
                ("testNumberFormatterRendersNothingForNSDate", testNumberFormatterRendersNothingForNSDate),
                ("testDateFormatterRendersNothingForMissingValue", testDateFormatterRendersNothingForMissingValue),
                ("testDateFormatterRendersNothingForNSNull", testDateFormatterRendersNothingForNSNull),
                ("testDateFormatterRendersNothingForNSString", testDateFormatterRendersNothingForNSString),
                ("testDateFormatterRendersNothingForNSNumber", testDateFormatterRendersNothingForNSNumber),
           ]
   }
}

