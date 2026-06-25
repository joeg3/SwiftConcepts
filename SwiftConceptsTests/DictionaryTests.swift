import XCTest  // Used for all unit testing

final class DictionaryTests: XCTestCase {  // XCTestCase is the class used for unit testing

    // Dictionary keys must be unique
    // Dictionaries have no order
    
    func testCreateDictionary() {
        var ages = [String: Int]()  // Empty dict, so specify types
        ages["Fred"] = 44
        
        let grades1 = ["science": "C", "math": "A"] // Infers types since we're giving it values
        let grades2: [String: String] = ["science": "C", "math": "A"] // Use type annotation to be explicit of key/value types
        
        // With Dicts, for a given key, we don't know if there will be a value, so it returns optional
        // Can use a default to handle keys without values
        XCTAssertEqual(grades1["math", default: "Unknown"], "A")
        XCTAssertEqual(grades2["reading", default: "Unknown"], "Unknown") // no "reading" key, so return default
        XCTAssertNil(grades2["reading"]) // returns nil for non-existent key with no default; an array would error out
    }
    
    func testCount() {
        let grades = ["science": "C", "math": "A"]
        XCTAssertEqual(grades.count, 2)
    }
    
    func testAddRemove() {
        var ages = ["fred": 44]
        XCTAssertEqual(ages.count, 1)
        ages["jim"] = 22
        ages["jim"] = 33 // overwrite
        XCTAssertEqual(ages.count, 2)
        ages.removeValue(forKey: "fred")
        XCTAssertEqual(ages.count, 1)
        ages.removeAll()
        XCTAssertEqual(ages.count, 0)
    }
    
    func testDictOfCustomType() {
        struct Address {
            let city: String
            let state: String
        }

        let addresses: [String: Address] = [
            "tim": Address(city: "Denver", state: "CO"),
            "mary": Address(city: "St Paul", state: "MN"),
            "tom": Address(city: "Los Angeles", state: "CA")
        ]
        let address = addresses["tom"]
        XCTAssertEqual(address?.city, "Los Angeles")
    }
}
