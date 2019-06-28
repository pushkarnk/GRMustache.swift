import XCTest

extension MustacheBoxDocumentationTests {

   static var allTests : [(String, (MustacheBoxDocumentationTests) -> () throws -> Void)] {
      return [
                ("testRenderingDocumentation", testRenderingDocumentation),
                ("testRenderingInfoDocumentation", testRenderingInfoDocumentation),
           ]
   }
}

