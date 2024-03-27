import XCTest // Used for all unit testing
@testable import SwiftConcepts // This imports our SwiftConcepts project code into the test

final class StructuresTests: XCTestCase { // XCTestCase is the class used for unit testing
  
  struct Employee {
    var name:String
    var city:String
    var age:Int
  }
  
  override func setUp() { // Runs before each test method
  }
  
  override func tearDown() { // Runs after each test method
  }
  
  func testConstantsAndVariables() {
  }
}
