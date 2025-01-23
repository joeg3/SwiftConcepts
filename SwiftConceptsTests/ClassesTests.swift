import XCTest // Used for all unit testing
//@testable import SwiftConcepts // This imports our SwiftConcepts project code into the test

final class ClassesTests: XCTestCase { // XCTestCase is the class used for unit testing
  class ScreenViewModel {
    let title: String
    private(set) var showButton: Bool // Use private(set) to only set showButton from within the class, but can still get value directly
    
    // If we gave member variables default values, we would be required to write this init()
    init(title: String, showButton: Bool) {
      self.title = title
      self.showButton = showButton
    }
    
    // Runs as object is removed from memory. Required for classes, not structs
    deinit {
      
    }
    
    func hideButton() {
      showButton = false
    }
    
    func updateShowButton(newValue: Bool) {
      showButton = newValue
    }
    
  }
  func testClass() {
    // Use let, because viewModel is a constant reference to the object in memory which we can mutate
    let viewModel: ScreenViewModel = ScreenViewModel(title: "Screen 1", showButton: true)
    viewModel.hideButton()
    viewModel.updateShowButton(newValue: false)
    XCTAssertEqual(2,2)
  }
  
  
  
  
}
  
  
