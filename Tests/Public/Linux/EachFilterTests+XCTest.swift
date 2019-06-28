import XCTest

extension EachFilterTests {

   static var allTests : [(String, (EachFilterTests) -> () throws -> Void)] {
      return [
                ("testEachFilterEnumeratesSet", testEachFilterEnumeratesSet),
                //("testEachFilterEnumeratesNSSet", testEachFilterEnumeratesNSSet),
                ("testEachFilterTriggersRenderFunctionsInArray", testEachFilterTriggersRenderFunctionsInArray),
                ("testEachFilterTriggersRenderFunctionsInDictionary", testEachFilterTriggersRenderFunctionsInDictionary),
                ("testEachFilterDoesNotMessWithItemValues", testEachFilterDoesNotMessWithItemValues),
                ("testEachFilterDoesNotMessWithItemKeyedSubscriptFunction", testEachFilterDoesNotMessWithItemKeyedSubscriptFunction),
                ("testEachFilterDoesNotMessWithItemRenderFunction", testEachFilterDoesNotMessWithItemRenderFunction),
           ]
   }
}

