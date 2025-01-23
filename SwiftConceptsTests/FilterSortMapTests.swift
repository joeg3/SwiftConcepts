import XCTest // Used for all unit testing
//@testable import SwiftConcepts // This imports our SwiftConcepts project code into the test

final class FilterSortMapTests: XCTestCase { // XCTestCase is the class used for unit testing
  
  struct User {
    let name: String
    let isPremium: Bool
    let order: Int
  }
  
  var allUsers: [User] = [
    User(name: "John", isPremium: true, order: 4),
    User(name: "Jane", isPremium: false, order: 1),
    User(name: "Jack", isPremium: true, order: 3),
    User(name: "Jill", isPremium: false, order: 777),
    User(name: "Tom", isPremium: false, order: 2),
  ]
  
  func testFilterWithLoop() {
    var allPremiumUsers: [User] = []
    
    for user in allUsers {
      if user.isPremium {
        allPremiumUsers.append(user)
      }
    }
    XCTAssertEqual(allPremiumUsers.count, 2)
  }
  
  func testFilterWithFilter() {
    // Using a filter, we don't need for loop
    var allPremiumUsers: [User] = allUsers.filter { user in
      return user.isPremium // Can also omit return keyword
    }
    XCTAssertEqual(allPremiumUsers.count, 2)
  }
  
  func testFilterWithFilterShorthand() {
    // Use shorthand
    var allPremiumUsers: [User] = allUsers.filter({ $0.isPremium})
    XCTAssertEqual(allPremiumUsers.count, 2)
  }
  
  func testSort() {
    var orderedUsers: [User] = allUsers.sorted { user1, user2 in // user1 and user2 signify any two users being compared as sort iterates
      return user1.order < user2.order
    }
    XCTAssertEqual(orderedUsers[4].order, 777)
  }
  
  func testSortShorthand() {
    var orderedUsers: [User] = allUsers.sorted(by: { $0.order < $1.order})
    XCTAssertEqual(orderedUsers[4].order, 777)
  }
  
  func testMapNames() {
    // Transform (map) array of users to array of names
    var userNames: [String] = allUsers.map { user in
      return user.name
    }
    XCTAssertEqual(userNames.count, 5)
  }
  
  func testMapNamesShorthand() {
    // Transform (map) array of users to array of names
    var userNames: [String] = allUsers.map({ $0.name})
    XCTAssertEqual(userNames.count, 5)
  }
}
