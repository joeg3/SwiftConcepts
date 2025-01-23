import XCTest // Used for all unit testing
//@testable import SwiftConcepts // This imports our SwiftConcepts project code into the test

final class FunctionsTests: XCTestCase { // XCTestCase is the class used for unit testing
  
  override func setUp() { // Runs before each test method
  }
  
  override func tearDown() { // Runs after each test method
  }
  
  
  func testFunctionReturnValue() {
    XCTAssertEqual(retrunValue(), 7)
  }
  
  func testFunctionWithArgs() {
    XCTAssertEqual(funcAddArgs(x: 5, y: 4), 9)
  }
  
  func testGuardStatement() {
    XCTAssertEqual(funcWithGuardStatement(name: "Fred"), "Fred")
    XCTAssertEqual(funcWithGuardStatement(name: "Jim"), "Not Fred")
  }
  
  func testCalculatedVariables() {
    let x = 2
    let y = 3
    
    // A calculated variable is basically the same as a function with no args.
    // It has a closure and can set its value from running lines of code
    // They are used in lieu of a function when you don't need to pass data into the function
    var calculatedVariable: Int {
      return x + y
    }
    func calcNums() -> Int {
      return x + y
    }
    var calculatedFromFunc = calcNums()
    XCTAssertEqual(calculatedVariable, 5)
    XCTAssertEqual(calculatedFromFunc, 5)
    
    
  }
  
}

func basicFunction1() {
  print("Hi there")
}
func basicFunction2() -> Void { // Same as previous, but explicitly say it doesn't return enything
  print("Hi there")
}

func retrunValue() -> Int { // Have to specify return type
  return 7
}

func funcAddArgs(x: Int, y: Int) -> Int {
  return x + y
}

func funcWithGuardStatement(name: String) -> String {
  
  // Make sure name == Fred
  guard name == "Fred" else {
    return "Not Fred"
  }
  return name
}
