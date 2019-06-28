import XCTest

extension LoggerTests {

   static var allTests : [(String, (LoggerTests) -> () throws -> Void)] {
      return [
                ("testFullTemplateLogging", testFullTemplateLogging),
                ("testPartialTemplateLogging", testPartialTemplateLogging),
           ]
   }
}

