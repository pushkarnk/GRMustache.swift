import XCTest

extension ConfigurationExtendBaseContextTests {

   static var allTests : [(String, (ConfigurationExtendBaseContextTests) -> () throws -> Void)] {
      return [
                ("testConfigurationExtendBaseContextWithValue", testConfigurationExtendBaseContextWithValue),
                ("testConfigurationExtendBaseContextWithProtectedObject", testConfigurationExtendBaseContextWithProtectedObject),
                ("testConfigurationExtendBaseContextWithWillRenderFunction", testConfigurationExtendBaseContextWithWillRenderFunction),
           ]
   }
}

