import XCTest

extension VariadicFilterTests {

   static var allTests : [(String, (VariadicFilterTests) -> () throws -> Void)] {
      return [
                ("testVariadicFilterCanAccessArguments", testVariadicFilterCanAccessArguments),
                ("testVariadicFilterCanReturnFilter", testVariadicFilterCanReturnFilter),
                ("testVariadicFilterCanBeRootOfScopedExpression", testVariadicFilterCanBeRootOfScopedExpression),
                ("testVariadicFilterCanBeUsedForObjectSections", testVariadicFilterCanBeUsedForObjectSections),
                ("testVariadicFilterCanBeUsedForEnumerableSections", testVariadicFilterCanBeUsedForEnumerableSections),
                ("testVariadicFilterCanBeUsedForBooleanSections", testVariadicFilterCanBeUsedForBooleanSections),
                ("testImplicitIteratorCanBeVariadicFilterArgument", testImplicitIteratorCanBeVariadicFilterArgument),
           ]
   }
}

