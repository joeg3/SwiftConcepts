import XCTest  // Used for all unit testing

final class ArrayTests: XCTestCase {  // XCTestCase is the class used for unit testing

    func testCreateArray() {
        // Arrays elements must all be of the same type. Can't mix strings and ints in same array.
        let temps = Array<Int>() // Longhand way. Parens make it possible to customize array like pre populating with 1000 zeros
        let scores = [Int]()     // Shorthand way, empty array must specify type
        let grades: [String] = [String]() // Another way to specify empty array
        let cities: [String] = []         // Yet another way to specify empty array
        
        let fruits1 = ["Apple", "Orange", "Banana", "Mango"]  // Swift infers a String array
        let fruits2: [String] = ["Pear", "Peach"]  // Use type annotation of [String] to specify String Array
        
        XCTAssertEqual(temps.count, 0)
        XCTAssertEqual(scores.count, 0)
        XCTAssertEqual(grades.count, 0)
        XCTAssertEqual(cities.count, 0)
        XCTAssertEqual(fruits1.count, 4)
        XCTAssertEqual(fruits2.count, 2)
    }
    
    func testCountAndIndices() {
        let grades = ["A", "B", "C", "D", "F"]
        XCTAssertEqual(grades.count, 5)
        XCTAssertEqual(grades.indices.first, 0)
        XCTAssertEqual(grades.indices.last, 4)  // The array has 5 elements
    }
    
    func testAppendInsertRemove() {
        var nums = [1, 2, 4, 3, 8]
        
        nums.insert(7, at: 2)
        XCTAssertEqual(nums.count, 6)
        XCTAssertEqual(nums[2], 7)
        
        nums.append(9)
        XCTAssertEqual(nums.count, 7)
        XCTAssertEqual(nums[6], 9)
        
        nums.remove(at: 3)
        XCTAssertEqual(nums.count, 6)
        
        nums.append(contentsOf: [11, 12])
        XCTAssertEqual(nums.count, 8)
        
        nums.insert(contentsOf: [11, 12], at: 2)
        XCTAssertEqual(nums.count, 10)
        
        nums = nums + [88, 99] // Add and array of same type
        XCTAssertEqual(nums.count, 12)
        
        nums.removeAll()
        XCTAssertEqual(nums.count, 0)
    }
    
    func testContains() {
        let nums = [1, 2, 4, 3, 8]
        XCTAssertTrue(nums.contains(3))
        XCTAssertFalse(nums.contains(7))
    }
    
    func testFirstAndLast() {
        var nums = [1, 2, 4, 3, 8]
        XCTAssertEqual(nums.first, 1)
        XCTAssertEqual(nums.last, 8)
        
        if let first = nums.first {
            XCTAssertEqual(first, 1)
        }
        
        // Returns nil using on empty array
        nums.removeAll()
        XCTAssertNil(nums.first)
        XCTAssertNil(nums.last)
    }
    
    func testSortArray() {
        let nums1 = [7, 2, 4, 8, 3]
        let nums2 = nums1.sorted()
        XCTAssertEqual(nums2.first, 2)
        XCTAssertEqual(nums2.last, 8)
        XCTAssertEqual(nums1.first, 7) // Original array we called sorted() on is not changed
        XCTAssertEqual(nums1.last, 3)
    }
    
    func testArrayOfCustomType() {
        struct Product {
            let name: String
            let price: Double
        }
        let products: [Product] = [
            Product(name: "Apple", price: 1.99),
            Product(name: "Orange", price: 1.33),
        ]
        XCTAssertEqual(products[1].name, "Orange")
    }

    func testSet() {
        // Arrays can have duplicate items, sets cannot
        // Also, arrays maintain order of items, sets don't keep order
        let fruitSet: Set<String> = ["Apple", "Banana", "Orange", "Apple"]  // Use type annotation of Set<String> to specify set of strings
        XCTAssertEqual(fruitSet.count, 3)  // Second apple not in set
        let carSet = Set(["Ford", "Toyota", "Honda"])  // Create a set from an array
        let sortedCars = Array(carSet).sorted()  // Returns sorted array, carSet is not modified
        XCTAssertEqual(sortedCars, ["Ford", "Honda", "Toyota"])
        var citySet = Set<String>()  // Create empty set
        citySet.insert("New York")  // Note since sets have no order, we use insert() instead of append() with arrays

    }
}
