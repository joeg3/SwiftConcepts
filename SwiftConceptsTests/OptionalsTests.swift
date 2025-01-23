import XCTest // Used for all unit testing
//@testable import SwiftConcepts // This imports our SwiftConcepts project code into the test

final class OptionalsTests: XCTestCase { // XCTestCase is the class used for unit testing
  
  // Optionl values are where the variable might have no value: nil
  // An integer always has a number, an optional integer might have a number or might be nil.
  // A regular variable cannot be nil, only optional variables can be.
  // Optionals are useful because when you work with data, you won't always know if it'll be there.
  // Any type can be optional: Bool, Int, String, etc.
  
  /*
   Three ways to unwrap an optional:
   1. Nil Coalescing
   2. If-let
   3. Guard
   */
  
  
  
  func testBasicOptionals() {
    var myBool: Bool = false // Always has a value - either true or false
    var myOptionalBool: Bool? = nil // ? indicates optional - we don't know if it has a value, but if it does, it's a boolean
    
    print(myOptionalBool) // prints: nil
    myOptionalBool = true
    print(myOptionalBool) // prints: Optional(true)
    myOptionalBool = false
    print(myOptionalBool) // prints: Optional(false)
    myOptionalBool = nil
    print(myOptionalBool) // prints: nil
    
    // Print statments give warning that Expression implicitly coerced from 'Bool?' to 'Any'
    // You can provide a default value to get rid of warning - see nil coalescing test below
    // Nil coalescing operator is used to provide a default value:
    let newValue: Bool? = myOptionalBool // Set optional value to another optional value
    //let newValue2: Bool = myOptionalBool // Can't do this, cant set an optional value to a non-optional value
    
    // Here, newValue2 is equal to value of myOptionalBool (if there is one), otherwise if myOptionalBool is nil, return false
    // Think of ?? as meaning "otherwise"
    let newValue2: Bool = myOptionalBool ?? false // Now non-optional newValue2 can be set to value of optional myOptionalBool
    print("newValue2: \(newValue2.description)")
    XCTAssertEqual(newValue2, false)
    
    var myString: String? = "Hi"
    XCTAssertEqual(myString ?? "No value", "Hi") // myString ?? "No value" returns value of myString, or if nil, returns "No value"
    myString = nil
    XCTAssertEqual(myString ?? "No value", "No value")
  }
  
  func testOptionalNilCoalescing() {
    var myOptionalBool: Bool? = nil
    
    // Nil coalescing operator is used to provide a default value:
    let newOptBool: Bool? = myOptionalBool // Set optional value to another optional value
    XCTAssertEqual(newOptBool, nil)
    //let newValue2: Bool = myOptionalBool // Can't do this, cant set an optional value to a non-optional value
    // Read on for many ways to handle this
    
    // Here, newValue2 is equal to value of myOptionalBool (if there is one), otherwise if myOptionalBool is nil, return false
    // Think of ?? as meaning "otherwise"
    let nonOptBool: Bool = myOptionalBool ?? false // Now non-optional newValue2 can be set to value of optional myOptionalBool
    print("nonOptBool: \(nonOptBool.description)")
    XCTAssertEqual(nonOptBool, false)
    
    var myOptString: String? = "Hi"
    XCTAssertEqual(myOptString ?? "No value", "Hi") // myString ?? "No value" returns value of myString, or if nil, returns "No value"
    myOptString = nil
    XCTAssertEqual(myOptString ?? "No value", "No value")
  }
  
  func testOptionalAndFunction() {
    var userIsPremium: Bool? = nil
    
    func checkIfUserIsPremium() -> Bool { // We want a true/false return value, not an optional Bool
      return userIsPremium ?? false // If userIsPremium is nil, return false
    }
    
    XCTAssertEqual(checkIfUserIsPremium(), false)
  }
  
  func testIfLetOptional() {
    var userIsPremium: Bool? = nil
    
    func checkIfUserIsPremium() -> Bool {
      
      // This is another way to unwrap an optional
      if let newValue = userIsPremium { // If userIsPremium has a value (true/false), set newValue to it, otherwise go to else block
        // Here we have access to the non-optional variable newValue
        return newValue
      } else { // userIsPremium has no value (nil)
        return false // Essentially making default value false
      }
    }
    XCTAssertEqual(checkIfUserIsPremium(), false)
    
    // Same as checkIfUserIsPremium(), but more consise
    func checkIfUserIsPremiumConsise() -> Bool {
      if let userIsPremium {
        return userIsPremium // If optional outer variable userIsPremium has a value, create new local non-optional userIsPremium variable
      }
      
      return false // Not necessary to be in else block
    }
    XCTAssertEqual(checkIfUserIsPremiumConsise(), false)
  }
  
  // With a guard, failure to have a value enters the closure
  // With if-let, success of having a value enters the closure
  func testGuardOptional() {
    var userIsPremium: Bool? = nil
    
    func checkIfUserIsPremium() -> Bool {
      
      guard let newValue = userIsPremium else { // If userIsPremium has a value (true/false) assign to non-optional newValue, skip else block
        // We are here if userIsPremium is nil (has no value)
        return false
      }
      return newValue // newValue is a non-optional variable
    }
    XCTAssertEqual(checkIfUserIsPremium(), false)
    
    // Same as checkIfUserIsPremium(), but more consise
    func checkIfUserIsPremiumConsise() -> Bool {
      
      guard let userIsPremium else {
        return false
      }
      return userIsPremium // If optional outer variable userIsPremium has a value, create new local non-optional userIsPremium variable
    }
    XCTAssertEqual(checkIfUserIsPremiumConsise(), false)
  }
  
  func testChainIfLetAndGuardOptionals() {
    var employeeIsNew: Bool? = true
    var employeeTrained: Bool? = false
    var employeeCity: Bool? = nil
    
    // -------------------- Check status with If-Let --------------------------------- //
    func checkIfEmployeeSetupIfLet() -> Bool {
      
      // If all 3 variables have a value, enter closure
      if let employeeIsNew, let employeeTrained, let employeeCity {
        // If here none of, employeeIsNew, employeeTrained, employeeCity have nil value, the have Bool, Bool, String value respectively
        // The if-let creates new non-optional variables employeeIsNew, employeeTrained, employeeCity
        
        // In this closure we know we aren't passing optionals to the function
        // We pass in variables set in the if-let
        return getEmployeeStatus(employeeIsNew: employeeIsNew, employeeTrained: employeeTrained, employeeCity: employeeCity)
      } else {
        // If here, one or more of employeeIsNew, employeeTrained, employeeCity are nil
        return false
      }
    }
    
    // -------------------- Check status with Guard --------------------------------- //
    func checkIfEmployeeSetupGuard() -> Bool {
      
      // If any of 3 variables are nil, enter closure
      guard let employeeIsNew, let employeeTrained, let employeeCity else {
        return false
      }
      // If here none of, employeeIsNew, employeeTrained, employeeCity have nil value, the have Bool, Bool, String value respectively
      // Use them to return the status
      return getEmployeeStatus(employeeIsNew: employeeIsNew, employeeTrained: employeeTrained, employeeCity: employeeCity)
      
    }
    
    // Does not accept Optionals as arguments, both if-let and guard functions call this
    func getEmployeeStatus(employeeIsNew: Bool, employeeTrained: Bool, employeeCity: Bool) -> Bool {
      if employeeIsNew && employeeTrained {
        return true
      }
      return false
      
    }
    
    XCTAssertEqual(checkIfEmployeeSetupIfLet(), false)
    XCTAssertEqual(checkIfEmployeeSetupGuard(), false)
  }
  
  func testNestedIfLetAndGuardOptionals() {
    var employeeIsNew: Bool? = true
    var employeeTrained: Bool? = false
    var employeeCity: Bool? = nil
    
    // -------------------- Check status with nested If-Let --------------------------------- //
    // Best not to take this approach unless you have to
    func checkIfEmployeeSetupIfLet() -> Bool {
      if let employeeIsNew {
        // If here, employeeIsNew is a Bool, not nil
        
        if let employeeTrained {
          // If here, employeeTrained, employeeIsNew are Bool, not nil
          
          if let employeeCity {
            // If here, employeeTrained, employeeIsNew, employeeCity are Bool, not nil
            return getEmployeeStatus(employeeIsNew: employeeIsNew, employeeTrained: employeeTrained, employeeCity: employeeCity)
          } else {
            // If here, employeeCity is == nil
            return false
          }
        } else {
          // If here, employeeTrained is == nil
          return false
        }
      } else {
        // If here, employeeIsNew is == nil
        return false
      }
    }
    
    // -------------------- Check status with nested Guard --------------------------------- //
    func checkIfEmployeeSetupGuard() -> Bool {
      
      guard let employeeIsNew else {
        // If here, employeeIsNew is == nil
        return false
      }
      // If here, employeeIsNew is a Bool, not nil
      guard let employeeTrained else {
        // If here, employeeTrained is == nil
        return false
      }
      // If here, employeeIsNew, employeeTrained are Bool, not nil
      guard let employeeCity else {
        // If here, employeeCity is == nil
        return false
      }
      // If here, employeeIsNew, employeeTrained, employeeCity are Bool, not nil, can pass to function
      return getEmployeeStatus(employeeIsNew: employeeIsNew, employeeTrained: employeeTrained, employeeCity: employeeCity)
    }
    
    // Does not accept Optionals as arguments, both if-let and guard functions call this
    func getEmployeeStatus(employeeIsNew: Bool, employeeTrained: Bool, employeeCity: Bool) -> Bool {
      if employeeIsNew && employeeTrained {
        return true
      }
      return false
      
    }
    
    XCTAssertEqual(checkIfEmployeeSetupIfLet(), false)
    XCTAssertEqual(checkIfEmployeeSetupGuard(), false)
  }
  
  func testUnwrapWithOptionalChaining() {
    func getEmployeeName() -> String? { // Returns optional
      return "John"
    }
    func getEmployeeCity() -> String? { // Returns optional
      return nil
    }
    func getEmployeeTitle() -> String { // Returns String
      return "Manager"
    }
    
    let employeeName: String? = getEmployeeName() // Explicitly add String? to denote it's optional
    let employeeCity: String? = getEmployeeCity()
      
    // For count1, we didn't use Nil Coalescing, If-Let, or Guard to unwrap to String
    let count1 = employeeName?.count // If employeeName is nil, count1 will be nil, otherwise will have a value.
    XCTAssertEqual(count1, 4)
    let count2 = employeeCity?.count
    XCTAssertEqual(count2, nil)
    let count3 = employeeCity?.count ?? 0 // Here we give a default value of 0 if employeeName is nil
    XCTAssertEqual(count3, 0)
      
    // ----------------- This is optional chaining --------------------
    // employeeName could be "", which is a valid String, but not a valid first character
    // This is saying if employeeName has a value and first character has a value, then return value of isLowercase
    let firstLower1 = employeeName?.first?.isLowercase // Checks if first character of employeeName is lowercase, firstLower1 is still optional
    let firstLower2 = employeeName?.first?.isLowercase ?? false // Entire chain has default value of false if any part of chain is nil
      
    // getEmployeeTitle() returns a String, not an optional, so don't have to unwrap
    let employeeTitle: String = getEmployeeTitle()
    let count99 = employeeTitle.count // This is a String, will always get a value for count2
    XCTAssertEqual(count99, 7)
  }
  
  func testExplicitlyUnwrapOptional() {
    func getEmployeeName() -> String? { // Returns optional
      return "John"
    }
    func getEmployeeTitle() -> String { // Returns String
      return "Manager"
    }
    
    let employeeName: String? = getEmployeeName() // Explicitly add String? to denote it's optional
    
    // Use an exclamation mark for explicit unwrapping
    // The usual way with a ?, you get the count if employeeName is not nil
    // With explicit unwrap with a !, you get the count because you know for sure it's not nil
    // Dangerous because it will crash your application if employeeName is nil
    let count1: Int = employeeName!.count
    XCTAssertEqual(count1, 4)
  }
  
}
