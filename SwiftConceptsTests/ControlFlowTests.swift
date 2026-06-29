import XCTest  // Used for all unit testing

final class ControlFlowTests: XCTestCase {  // XCTestCase is the class used for unit testing

    override func setUp() {  // Runs before each test method
    }

    override func tearDown() {  // Runs after each test method
    }

    func testIfElse() {
        // Swift if statements allow short circuiting
        let num = 3

        if num < 9 {
            XCTAssertTrue(num < 9)
        }

        if num < 9 {
            XCTAssertTrue(num < 9)
        } else if num > 9 {
            // Can't get here
        } else {
            // Can't get here
        }

        let flag = true
        if flag {
            XCTAssertTrue(flag)
        }
        if !flag {
            // Can't get here
        }

        if num < 9 && flag {
            XCTAssertTrue(num < 9)
            XCTAssertTrue(flag)
        }

    }

    func testTernary() {
        // If condition it true, return value before the colon, otherwise return value after colon
        let m = 8
        let n = 9
        let min = m < n ? m : n
        let max = m > n ? m : n
        XCTAssertEqual(8, min)
        XCTAssertEqual(9, max)
    }

    func testRanges() {  // Countable Ranges used in For Loops and Switch statements
        let closedRange = 0...5  // Means 0 to 5 inclusive
        let halfOpenRange = 0..<5  // Means 0 to 4, 5 is excluded, both open and half open ranges must be increasing (2nd number >= than 1st)
        XCTAssertEqual(closedRange.count, 6)
        XCTAssertEqual(halfOpenRange.count, 5)
    }

    // ***************************************** For Loops *****************************************
    /*
     for <CONSTANT> in <COUNTABLE RANGE> {
       <LOOP CODE>
     }
     */

    func testForLoopWithCounter() {
        let maximum = 10
        var sum = 0
        for i in 1...maximum {  // Scope of i only visible in loop, end of range inclusive
            sum += i
        }
        XCTAssertEqual(sum, 55)
    }

    func testForLoopNoCounter() {
        // When doing something each time but don't need a loop variable, use underscore
        for _ in 0..<3 {  // The ..< range is non-inclusive of the end of the range, so 0 through 2 here
            print("hi")
        }
    }

    func testForLoopWithConditional() {
        // A conditional in loop, only sum odd numbers
        var sum = 0
        for i in 1...11 where i % 2 == 1 {
            sum += i
        }
        XCTAssertEqual(36, sum)
    }

    func testForLoopContinue() {
        var sum = 0
        for f in 0..<8 {
            if f % 2 == 0 {  // Continue statement, don't sum evens
                continue
            }
            sum += f
        }
        XCTAssertEqual(sum, 16)
    }

    func testForLoopRandom() {
        // *********** Random Numbers **********
        while Int.random(in: 1...6) != 6 {
            print("Die roll not a six")
        }
    }

    func testIterateArray() {
        let nums = [1, 2, 3, 4]
        var sum = 0
        for num in nums {  // num is the loop variable, scope only in loop
            sum += num
        }
        XCTAssertEqual(sum, 10)
    }

    func testEnumeratedArray() {
        struct SomeModel {
            let id: String
            let value: String
            let count: Int
        }
        let someVehicles = [
            SomeModel(id: "car", value: "Ford", count: 2),
            SomeModel(id: "truck", value: "Toyota", count: 1),
            SomeModel(id: "suv", value: "Honda", count: 3),
        ]

        for (index, vehicle) in someVehicles.enumerated() {
            if index == 1 {
                XCTAssertEqual(vehicle.count, 1)
            }
        }
    }

    // ************************ While and Repeat-While Loops ****************************
    func testWhileLoop() {
        var sum = 0
        while sum < 10 {
            sum += 3
        }
        XCTAssertEqual(sum, 12)
    }

    func testRepeatWhileLoop() {  // Repeat-While Loop (like a do-while in Java)
        var sum = 0
        repeat {
            sum += 3
        } while sum < 10
        XCTAssertEqual(sum, 12)
    }

    func testWhileWithBreak() {
        var count = 0
        while true {
            count += 1
            if count > 10 {
                break
            }
        }
        XCTAssertEqual(count, 11)
    }

    // ***************************** Switch Statements *********************************
    // Unlike an if statement, a switch must have some code to execute for every possible value of the thing you’re checking.

    func testSwitchOnNumber() {
        let number = 10
        var msg = ""

        switch number {
        case 0:
            msg = "Zero"
        default:
            msg = "Non-zero"
        }
        XCTAssertEqual(msg, "Non-zero")
    }

    func testSwitchOnString() {
        // Example with strings, use break in default block if no action necessary
        let animal = "Dog"
        var msg = ""

        switch animal {
        case "Cat", "Dog":
            msg = "Animal is a house pet."
        default:
            break
        }
        XCTAssertEqual(msg, "Animal is a house pet.")
    }

    func testSwitchOnEnum() {
        enum Menu {
            case soup, salad, burger
        }

        let order = Menu.burger
        var cost = 0

        switch order {  // You must check all enum options
        case .soup:
            cost = 4
        case .salad:
            cost = 6
        case .burger:
            cost = 8
        }
        XCTAssertEqual(cost, 8)
    }

    func testSwitchOnRange() {
        // You can use ranges
        var timeOfDay: String
        let hourOfDay = 13
        switch hourOfDay {
        case 0...5:
            timeOfDay = "Early morning"
        case 6...11:
            timeOfDay = "Morning"
        case 12...16:
            timeOfDay = "Afternoon"
        case 17...19:
            timeOfDay = "Evening"
        case 20..<24:
            timeOfDay = "Late evening"
        default:
            timeOfDay = "INVALID HOUR!"
        }
        XCTAssertEqual(timeOfDay, "Afternoon")
    }

    func testSwitchWithFallthrough() {
        // Fallthrough keyword executes the next case, even if it doesn't match what you're switching on
        let number = 0
        var sum = 0

        switch number {
        case 0:
            sum += 100
            fallthrough
        case 1:
            sum += 1
            fallthrough
        case 2:
            sum += 2
            fallthrough
        default:
            sum += 10
        }
        XCTAssertEqual(sum, 113)
    }

}
