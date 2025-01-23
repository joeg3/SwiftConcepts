import XCTest // Used for all unit testing
@testable import SwiftBasics // This imports our SwiftBasics project code so we can test it

final class BasicsTests: XCTestCase { // XCTestCase is the class used for unit testing
  
  override func setUp() { // Runs before each test method
  }
  
  override func tearDown() { // Runs after each test method
  }
  
  func testPrint() {
    // If you don't want new lines
    for _ in 0...3 { // Prints hi 4 times
      print("hi, ", terminator: "") // no newline
    }
  }
  
  func testConstantsAndVariables() {
    var greeting: String = "Hello, playground" // Variable
    let myName: String = "Joe"                 // Constant
    var money: Double = 3.45                   // Float uses less memory but has less precision, so always go with Double
    var myVar: Int = 7_700_000                 // Can use separators for large numbers
    XCTAssertEqual(greeting, "Hello, playground")
    XCTAssertEqual(myName, "Joe")
    XCTAssertEqual(money, 3.45)
    XCTAssertEqual(7700000, myVar)
  }
  
  func testBasicMath() {
    XCTAssertLessThan(Double.pi, 4.0, "Pi constant")
    XCTAssertEqual((9.0).squareRoot(), 3.0, "Verify .squareRoot()")
    XCTAssertEqual(max(1, 9), 9, "Verify .max()")
    XCTAssertEqual(min(-4, -9), -9, "Verify .min()")
    
    var count: Int = 0
    count += 1
    XCTAssertEqual(count, 1, "Verify += operator")
    count += 5
    XCTAssertEqual(count, 6)
    count -= 2
    XCTAssertEqual(count, 4)
    count *= 5
    XCTAssertEqual(count, 20)
    count /= 2
    XCTAssertEqual(count, 10)
  }
  
  func testSwiftTypes() {
    let yes: Bool = true
    let no = false // Type inference
    XCTAssertTrue(yes)
    XCTAssertFalse(no)
    
    let typeInferredAsInt = 44 // You can press Option key and click on variable to check its type
    XCTAssertEqual(typeInferredAsInt, 44)
    
    var x: Int = Int(3.33) // x will be 3, lose fractional part in converting double
    XCTAssertEqual(x, 3)
    
    // Ensure type 4 different ways
    var d1 = Double(5)
    var d2: Double = 6
    var d3 = 7 as Double
    var d4 = 8.0
    XCTAssertEqual(5.0, d1)
    XCTAssertEqual(6.0, d2)
    XCTAssertEqual(7.0, d3)
    XCTAssertEqual(8.0, d4)
    
    let todaysDate: Date = Date() // Date() returns timestamp of right now
    let myInt: Int = 3
    let myDouble: Double = 3.0 // Used for math
    let myCGFloat: CGFloat = 3.0 // CGFloat used for UI for pixels, font sizes, etc.
  }
  
  func testSwiftTuples() {
    // Tuples for things like coordinates
    let coord1: (Int, Int) = (8, 9)
    let coord2 = (8, 9) // Type inference
    let coord3 = (8, 9.1) // Mix types

    // Reference data in tuple by position
    let x1 = coord1.0
    let y1 = coord1.1
    XCTAssertEqual(coord2.0, 8)
    XCTAssertEqual(coord3.1, 9.1)

    // Use labels for tuple data and retrieval (best practice)
    let coord4 = (x: 3, y: 9, z:11)
    let x4 = coord4.x
    let y4 = coord4.y
    let z4 = coord4.z
    let (a4, b4, c4) = coord4 // Shorthand to set new variables a4 to x, etc.
    let (j4, k4, _) = coord4 // Use "ignore" underscore if you only need first two values
    XCTAssertEqual(a4, 3)
  }
  
  func testTypeAliases() {
    typealias Dog = String // Creates an alternative name for "String" called "Dog", compiler treats "Dog" as a String
    let myDog: Dog = "Fido"
    typealias Coordinates = (Int, Int)
    let coords: Coordinates = (4, 5)
  }
  
  // ***************************************** Booleans ***************************************
  
  func testBooleanOperators() {
    XCTAssertTrue((3 == 3))
    XCTAssertTrue((4 != 5))
    XCTAssertFalse((6 > 7))
    XCTAssertTrue((8 < 9))
    XCTAssertFalse((6 >= 7))
    XCTAssertTrue((8 <= 9))
  }
  
  func testToggleBool() {
    var state = true
    state.toggle() // state now false
    XCTAssertFalse(state)
  }

}

