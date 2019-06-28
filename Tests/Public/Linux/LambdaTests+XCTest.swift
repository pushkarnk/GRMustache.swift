import XCTest

extension LambdaTests {

   static var allTests : [(String, (LambdaTests) -> () throws -> Void)] {
      return [
                ("testMustacheSpecInterpolation", testMustacheSpecInterpolation),
                ("testMustacheSpecInterpolationExpansion", testMustacheSpecInterpolationExpansion),
                ("testMustacheSpecInterpolationAlternateDelimiters", testMustacheSpecInterpolationAlternateDelimiters),
                ("testMustacheSpecMultipleCalls", testMustacheSpecMultipleCalls),
                ("testMustacheSpecEscaping", testMustacheSpecEscaping),
                ("testMustacheSpecSection", testMustacheSpecSection),
                ("testMustacheSpecSectionExpansion", testMustacheSpecSectionExpansion),
                ("testMustacheSpecSectionAlternateDelimiters", testMustacheSpecSectionAlternateDelimiters),
                ("testMustacheSpecSectionMultipleCalls", testMustacheSpecSectionMultipleCalls),
                ("testMustacheSpecInvertedSection", testMustacheSpecInvertedSection),
                ("testPartialInArity0Lambda", testPartialInArity0Lambda),
                ("testPartialInArity1Lambda", testPartialInArity1Lambda),
                ("testArity0LambdaInSectionTag", testArity0LambdaInSectionTag),
                ("testArity1LambdaInVariableTag", testArity1LambdaInVariableTag),
           ]
   }
}

