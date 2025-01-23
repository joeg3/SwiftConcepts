import XCTest // Used for all unit testing
//@testable import SwiftConcepts // This imports our SwiftConcepts project code into the test

final class DictionaryTests: XCTestCase { // XCTestCase is the class used for unit testing
  
  // Dictionary keys must be unique
  // Dictionaries have no order
  
  func testDictionary() {
    var fruitArray: [String] = ["Apple", "Orange", "Banana", "Apple"]
    var fruitSet: Set<String> = ["Apple", "Orange", "Banana", "Apple"]
    
    XCTAssertEqual(fruitArray.count, 4)
    XCTAssertEqual(fruitSet.count, 3) // Second apple not counted
    
    var firstDictionary: [String : Bool] = ["Apple": true, "Orange": false, "Banana": true]
    let item = firstDictionary["Orange"] // item is an optional bool
    let noitem = firstDictionary["Pear"] // returns nil for non-existent key, unlike an array which would error out
    XCTAssertEqual(item, false)
    
    // Add to dictionary
    firstDictionary["Pear"] = true
    XCTAssertEqual(firstDictionary["Pear"]!, true)
    
    // Remove from dictionary
    firstDictionary.removeValue(forKey: "Pear")
    
    struct SomeModel {
      let id: String
      let value: String
      let count: Int
    }
    
    var someArray: [SomeModel] = [
      SomeModel(id: "car", value: "Ford", count: 2),
      SomeModel(id: "truck", value: "Toyota", count: 1),
      SomeModel(id: "suv", value: "Honda", count: 3),
    ]
    let truckFromArray = someArray[1]
    
    var someDict: [Int : SomeModel] = [
      1 : SomeModel(id: "car", value: "Ford", count: 2),
      2 : SomeModel(id: "truck", value: "Toyota", count: 1),
      3 : SomeModel(id: "suv", value: "Honda", count: 3),
    ]
    let truckFromDict = someDict[2]
    
  }
}
