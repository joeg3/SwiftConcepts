import XCTest // Used for all unit testing
//@testable import SwiftConcepts // This imports our SwiftConcepts project code into the test

final class TuplesTests: XCTestCase { // XCTestCase is the class used for unit testing
  
  // Tuples allow you to have functions return more than one value

  func testBasicTuples() {
    
    var employeeName: String = "John"
    var isManager: Bool = false
    var isNewHire: Bool = true
    
    func getEmployeeName() -> String {
      employeeName
    }
    
    func getEmployeeIsManager() -> Bool {
      isManager
    }
    
    // Returns on piece of data
    func getEmployeeInfo() -> String {
      let name = getEmployeeName()
      let isManager = getEmployeeIsManager()
      
      return name
      
    }
    
    // Returns a tuple - multiple pieces of data
    func getEmployeeInfo2() -> (String, Bool) {
      let name = getEmployeeName()
      let isManager = getEmployeeIsManager()
      
      return (name, isManager)
    }
    
    // Declaring tuples
    var empData1: String = employeeName // Declare regular variable
    var empData2: (String, Bool, Bool) = (employeeName, isManager, isNewHire) // Declare tuple variable that contains 3 data values
    
    // Problem below of using indices is having to look back at function to see what item in tuple is what
    let data1 = getEmployeeInfo2() // data will be tuple of type (String, Bool), the type getEmployeeInfo2() returns
    let name1 = data1.0 // Pull out first item from tuple
    let isMgr1 = data1.1 // Pull out second item, a Bool
    
    // Returns a tuple - but we name the tuple items for easier retrieval later
    func getEmployeeInfo3() -> (name: String, isMgr: Bool) {
      let name = getEmployeeName()
      let isManager = getEmployeeIsManager()
      
      return (name, isManager)
    }
    
    // Here the tuple returned by getEmployeeInfo3() has named parameters that you can see by Option-clicking on the variable in XCode
    let data2 = getEmployeeInfo3() // data will be tuple of type (String, Bool), the type getEmployeeInfo2() returns
    let name2 = data2.name // Pull out first item from tuple
    let isMgr2 = data2.isMgr // Pull out second item, a Bool
    
    // You can pass a tuple into a function
    func getEmployeeInfo4() -> (name: String, isMgr: Bool, newHire: Bool) {
      return (employeeName, isManager, isNewHire)
    }
    
    func processEmployeeInfo(info: (name: String, isMgr: Bool, newHire: Bool)) {
      
    }
    
    let info = processEmployeeInfo(info: getEmployeeInfo4())
    
    
    XCTAssertEqual(3, 3)
  }
}
