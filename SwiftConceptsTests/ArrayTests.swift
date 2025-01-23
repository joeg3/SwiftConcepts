import XCTest // Used for all unit testing
///@testable import SwiftConcepts // This imports our SwiftConcepts project code into the test

final class ArrayTests: XCTestCase { // XCTestCase is the class used for unit testing
  
  func testArray() {
    let apple: String = "Apple"
    let orange: String = "Orange"
    
    // These are of type Array String
    var fruits1: [String] = ["Apple", "Orange", "Banana", "Mango"]
    let fruits2: [String] = [apple, orange]
    let fruits3: Array<String> = [apple, orange]
    
    let count = fruits1.count
    let first = fruits1.first // Return nil if empty
    let last = fruits1.last // Return nil if empty
    
    if let first = fruits1.first {
      // first item
    }
    XCTAssertEqual(fruits1.count, 4)
    
    fruits1 = fruits1 + ["Kiwi"] // fruits1 needs to be a var
    fruits1.append("Kiwi") // Better way to add item to array
    fruits1.append(contentsOf: ["Kiwi", "Grapes"]) // Add multiple items to array
    
    let firstIndex = fruits1.indices.first
    let lastIndex = fruits1.indices.last
    fruits1[2] // Third item at second index
    
    // Make sure item exists before accessing it
    if fruits1.indices.contains(2) {
      let item = fruits1[2]
    }
    
    fruits1.insert("Watermelon", at: 1)
    XCTAssertEqual(fruits1[1], "Watermelon")
    fruits1.insert(contentsOf: ["Banana", "Grapes"], at: 2)
    XCTAssertEqual(fruits1[3], "Grapes")
    fruits1.remove(at: 2)
    XCTAssertEqual(fruits1[2], "Grapes")
    fruits1.removeAll()
    
    // Array of a custom type
    struct Product {
      let name: String
      let price: Double
    }
    var products: [Product] = [
      Product(name: "Apple", price: 1.99),
      Product(name: "Orange", price: 1.33)
    ]
    
  }
  
  func testSet() {
    // Arrays can have duplicate items, sets cannot
    // Also, arrays maintain order of items, sets don't keep order
    var fruitSet: Set<String> = ["Apple", "Banana", "Orange", "Apple"]
    XCTAssertEqual(fruitSet.count, 3) // Second apple not added
    
    
  }
}
