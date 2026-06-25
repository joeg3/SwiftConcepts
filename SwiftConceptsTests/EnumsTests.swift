import XCTest

final class EnumsTests: XCTestCase {

    // Enums are a set of named values we can use in our code
    
    func testCreateEnum() {
        enum TempUnit {
            case celsius
            case fahrenheit
            case kelvin
        }
        
        // Can also do one line
        enum Weekday {
            case monday, tuesday, wednesday, thursday, friday
        }
    }
    
    func testAssignEnum() {
        enum TempUnit {
            case celsius, fahrenheit, kelvin
        }
        
        var unit = TempUnit.kelvin
        unit = .celsius // Don't need TempUnit prefix since unit variable is already of type TempUnit
        XCTAssertTrue(unit == .celsius)
    }
    
    func testEnumComputedValues() {
        enum TempUnit {
            case celsius, fahrenheit, kelvin
            
            // Enums can have read-only computed property
            var abbreviation: String {
                // Switch is useful because compiler complains if you don't include all the cases
                switch self {
                case .celsius:
                    return "C"
                case .fahrenheit:
                    return "F"
                case .kelvin:
                    return "K"
                }
            }
        }
            
        XCTAssertEqual(TempUnit.celsius.abbreviation, "C")
        
    }
}
