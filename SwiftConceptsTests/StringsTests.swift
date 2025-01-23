import XCTest // Used for all unit testing
//@testable import SwiftConcepts // This imports our SwiftConcepts project code into the test

final class StringsTests: XCTestCase { // XCTestCase is the class used for unit testing
  
  override func setUp() { // Runs before each test method
  }
  
  override func tearDown() { // Runs after each test method
  }
  
  func testCharacters() {
    // Character data type, no such thing as a character literal in Swift
    // A Character is just a string of length one, so no type inference for Characters
    let char1: Character = "a"
    let char2: Character = "😀"
  }
  
  func testStringInstantiation() {
    // String data type
    let str1: String = "Hello"
    let str2 = "World" // Type inference
    XCTAssertEqual(str1, "Hello")
    XCTAssertEqual(str2, "World")
  }
  
  func testStringConcatination() {
    let str1: String = "Hello"
    let str2 = "World"

    // Concatenation
    var phrase = str1 + " " + str2
    phrase += "!"
    let exclamationMark: Character = "!"
    phrase += String(exclamationMark) // need to explicitly convert character to string to concatenate
    XCTAssertEqual(phrase, "Hello World!!")
  }
  
  func testStringInterpolation() {
    let name = "Joe"
    var message = "Hello my name is \(name)!"
    let num = 42
    let msg = "My num is \(num)!!!"
    XCTAssertEqual(message, "Hello my name is Joe!")
    XCTAssertEqual(msg, "My num is 42!!!")
  }
  
  func testMulitlineStrings() {
    // Multi-line Strings
    let myCode = """
      let a = 5
      let b = 2
      var c = a + b
      """ // Swift strips out the indented spaces from all lines, allowing you to indent for formattign.
    XCTAssertEqual(myCode, "let a = 5\nlet b = 2\nvar c = a + b")
  }
  
  func testStringEquality() {
    let word = "tree"
    let check = word == "rock"
    let alphpbeticalOrder = "rock" < "tree" // Returns true, rock comes before tree
    XCTAssertTrue(alphpbeticalOrder)
  }
  
}
