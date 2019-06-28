import XCTest

extension FoundationCollectionTests {

   static var allTests : [(String, (FoundationCollectionTests) -> () throws -> Void)] {
      return [
                ("testNSArrayIsIterated", testNSArrayIsIterated),
                ("testNSArrayIsNotIteratedWithValueForKey", testNSArrayIsNotIteratedWithValueForKey),
                ("testNSArrayIsEmpty", testNSArrayIsEmpty),
                ("testNSArrayCountKey", testNSArrayCountKey),
                ("testNSArrayKeyFirst", testNSArrayKeyFirst),
                ("testNSArrayLastKey", testNSArrayLastKey),
                ("testArrayIsIterated", testArrayIsIterated),
                ("testArrayIsNotIteratedWithValueForKey", testArrayIsNotIteratedWithValueForKey),
                ("testArrayIsEmpty", testArrayIsEmpty),
                ("testArrayCountKey", testArrayCountKey),
                ("testArrayKeyFirst", testArrayKeyFirst),
                ("testArrayLastKey", testArrayLastKey),
                ("testNSSetIsIterated", testNSSetIsIterated),
                ("testNSSetIsNotIteratedWithValueForKey", testNSSetIsNotIteratedWithValueForKey),
                ("testNSSetIsEmpty", testNSSetIsEmpty),
                ("testNSSetCountKey", testNSSetCountKey),
                ("testNSSetFirstKey", testNSSetFirstKey),
                ("testNSSetLastKey", testNSSetLastKey),
                ("testSetIsIterated", testSetIsIterated),
                ("testSetIsNotIteratedWithValueForKey", testSetIsNotIteratedWithValueForKey),
                ("testSetIsEmpty", testSetIsEmpty),
                ("testSetCountKey", testSetCountKey),
                ("testSetFirstKey", testSetFirstKey),
                ("testSetLastKey", testSetLastKey),
                ("testNSOrderedSetIsIterated", testNSOrderedSetIsIterated),
                ("testNSOrderedSetIsNotIteratedWithValueForKey", testNSOrderedSetIsNotIteratedWithValueForKey),
                ("testNSOrderedSetCountKey", testNSOrderedSetCountKey),
                ("testNSOrderedSetKeyFirst", testNSOrderedSetKeyFirst),
                ("testNSOrderedSetLastKey", testNSOrderedSetLastKey),
           ]
   }
}

