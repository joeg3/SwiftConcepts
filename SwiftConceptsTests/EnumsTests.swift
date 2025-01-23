import XCTest // Used for all unit testing
//@testable import SwiftConcepts // This imports our SwiftConcepts project code into the test

final class EnumsTests: XCTestCase { // XCTestCase is the class used for unit testing
  
  // Enums are the same as structs except we know all the cases at runtime.
  
  func testStruct() {
    struct CarModel {
      let brand: CarBrand
      let model: String
    }
    struct CarBrand {
      let title: String
    }
    
    var brand1 = CarBrand(title: "Ford")
    var brand2 = CarBrand(title: "Toyota")
    
    // Struct: Brand can change at runtime
    var car1 = CarModel(brand: brand1, model: "Fiesta")
    var car2 = CarModel(brand: brand1, model: "Focus")
    var car3 = CarModel(brand: brand2, model: "Camry")
  }
  
  func testEnum() {
    struct CarModel {
      let brand: CarBrandOption
      let model: String
    }
    
    // Enum: here we limit the options to ford and toyota
    enum CarBrandOption {
      case ford
      case toyota
      case honda, chevy // Can also define on one row
      
      // Enums can have computed variables
      var title: String {
        // Switch is useful because compiler complains if you don't include all the cases
        switch self {
        case .ford:
          return "Ford"
        case .toyota:
          return "Toyota"
        case .chevy:
          return "Chevy"
        case .honda:
          return "Honda"
        default:
          return "Default"
        }
        
      }
    }
    
    var car1 = CarModel(brand: CarBrandOption.ford, model: "Fiesta")
    var car2 = CarModel(brand: CarBrandOption.ford, model: "Focus")
    var car3 = CarModel(brand: CarBrandOption.toyota, model: "Camry")
    
    XCTAssertEqual(car1.brand.title, "Ford")
    
  }
}
