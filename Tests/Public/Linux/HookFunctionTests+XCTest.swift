import XCTest

extension HookFunctionTests {

   static var allTests : [(String, (HookFunctionTests) -> () throws -> Void)] {
      return [
                ("testWillRenderFunctionIsNotTriggeredByText", testWillRenderFunctionIsNotTriggeredByText),
                ("testDidRenderFunctionIsNotTriggeredByText", testDidRenderFunctionIsNotTriggeredByText),
                ("testVariableHooks", testVariableHooks),
                ("testSectionHooks", testSectionHooks),
                ("testMultipleTagsObserver", testMultipleTagsObserver),
                ("testObserverInterpretsRenderedValue", testObserverInterpretsRenderedValue),
                ("testDidRenderFunctionObservesRenderedString", testDidRenderFunctionObservesRenderedString),
                ("testDidRenderFunctionObservesRenderingNSError", testDidRenderFunctionObservesRenderingNSError),
                ("testDidRenderFunctionObservesRenderingCustomError", testDidRenderFunctionObservesRenderingCustomError),
                ("testHookFunctionsOrdering", testHookFunctionsOrdering),
                ("testArrayOfWillRenderFunctionsInSectionTag", testArrayOfWillRenderFunctionsInSectionTag),
                ("testWillRenderFunctionCanProcessRenderFunction", testWillRenderFunctionCanProcessRenderFunction),
           ]
   }
}

