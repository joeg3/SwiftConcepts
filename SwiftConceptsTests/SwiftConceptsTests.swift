import XCTest // Used for all unit testing
@testable import SwiftConcepts // This imports our swift-concepts project code into the test

final class SwiftConceptsTests: XCTestCase { // XCTestCase is the class used for unit testing
  
  var basics: Basics! // The ! force unwraps the class
  
  override func setUp() { // Runs before each test method
    basics = Basics()
  }
  
  override func tearDown() { // Runs after each test method
    basics = nil
  }
  
  func testAddTenWorks() { // Unit test methods must start with word test to be picked up by test runner
    // Given
    var expected: Int = 0
    
    // When
    expected = basics.addTen(number: 9)
    
    // Then
    XCTAssert(expected == 19, "This should be 10")
    XCTAssertTrue(expected == 19)
    XCTAssertEqual(expected, 19, "Passing 9 to function should return 19")
  }
  
  func testBeSquareSucceeds() {
    var expected = basics.beSquare(7)
    XCTAssertEqual(expected, 49)
  }

}

