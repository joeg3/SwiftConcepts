//
//  SetTests.swift
//  SwiftConceptsTests
//
//  Created by Joseph Gliniecki on 6/25/26.
//

import XCTest  // Used for all unit testing

final class SetTests: XCTestCase {  // XCTestCase is the class used for unit testing

    // Sets are fast for data lookup
    // Similar to arrays, but don't remember order of elements, and can't contain duplicates
    
    func testCreateSet() {
        let names1 = Set(["jim", "bob", "ava"])       // Infers type since we're giving it values
        let names2 = Set<String>()                    // Specify type for empty set
        let names3: Set<String> = Set(["jim", "ava"]) // Even with inference, can explicitly specify type
        
        XCTAssertEqual(names1.count, 3)
        XCTAssertEqual(names2.count, 0)
        XCTAssertEqual(names3.count, 2)
    }
    
    func testCount() {
        let names = Set(["jim", "bob", "ava"])
        XCTAssertEqual(names.count, 3)
    }
    
    func testAddRemove() {
        var names = Set(["jim", "bob", "ava"])
        XCTAssertEqual(names.count, 3)
        names.insert("joe")
        XCTAssertEqual(names.count, 4)
        names.remove("bob")
        XCTAssertEqual(names.count, 3)
        names.removeAll()
        XCTAssertEqual(names.count, 0)
    }
}

