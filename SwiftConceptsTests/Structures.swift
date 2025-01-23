import XCTest // Used for all unit testing
//@testable import SwiftConcepts // This imports our SwiftConcepts project code into the test

final class StructuresTests: XCTestCase { // XCTestCase is the class used for unit testing
  
  // ----------------------------- Init Examples --------------------------
  func testImplicitInit() {
    struct Employee {
      let name:String
      let dateHired: Date
    }
    let employee1: Employee = Employee(name: "John", dateHired: .now) // This init is implicit, comes built in with Swift structs
  }
  
  func testCustomInit() {
    struct Employee {
      let name:String
      let dateHired: Date
      
      init(name: String, dateHired: Date = .now) { // Custom init with default of .now for dateHired
        self.name = name
        self.dateHired = dateHired
      }
    }
    let employee1: Employee = Employee(name: "John")
  }
  
  func testInitMutableParam() {
    struct Employee {
      let name:String
      let dateHired: Date
      let isManager: Bool?
      
      init(name: String, dateHired: Date = .now, isManager: Bool?) { // Custom init with optional for one parameter
        self.name = name
        self.dateHired = dateHired
        self.isManager = isManager ?? false // Nil coalescing
      }
    }
    let employee1: Employee = Employee(name: "John", isManager: nil)
  }
  
  // ----------------------------- Mutation Examples --------------------------
  func testImmutableStruct() {
    struct Employee { // It's immutable because it uses constants, not vars
      let name:String
      let isManager: Bool
    }
    var employee1: Employee = Employee(name: "John", isManager: false)
    
    func makeEmployeeManager() {
      // Since Employee is immutable, can't change it's values, so make a copy
      employee1 = Employee(name: employee1.name, isManager: true)
    }
  }
  
  func testMutableStruct() {
    struct Employee {
      let name:String
      var isManager: Bool // Mutable struct since isManager is a var
    }
    var employee1: Employee = Employee(name: "John", isManager: false)
    
    func makeEmployeeManager() {
      employee1.isManager = true // Here we can mutate the value
    }
  }
  
  // Better coding practice to have method inside of struct
  func testMutateImmutableStruct() {
    struct Employee { // It's immutable because it uses constants, not vars
      let name:String
      let isManager: Bool
      
      // Here the method to change isManager is part of struct
      func changeEmployeeManagerStatus(newValue: Bool) -> Employee {
        return Employee(name: name, isManager: newValue) // Since immutable member variables, have to create and return new object
      }
    }
    var employee1: Employee = Employee(name: "John", isManager: false)
    employee1 = employee1.changeEmployeeManagerStatus(newValue: true)
    XCTAssertEqual(employee1.isManager, true)
  }
  
  func testMutateMutableStruct() {
    struct Employee { // It's mutable because isManager is a var
      let name:String
      var isManager: Bool
      
      mutating func changeEmployeeManagerStatus(newValue: Bool) { // mutating keyword allows func to change member variable
        isManager = newValue
      }
    }
    var employee1: Employee = Employee(name: "John", isManager: false)
    employee1.changeEmployeeManagerStatus(newValue: true)
    XCTAssertEqual(employee1.isManager, true)
    
  }
}
