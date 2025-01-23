import XCTest // Used for all unit testing
//@testable import SwiftConcepts // This imports our SwiftConcepts project code into the test

final class AccessControlTests: XCTestCase { // XCTestCase is the class used for unit testing
  struct MovieModel {
    let title: String
    let genre:MovieGenre
    private(set) var isFavorite: Bool // Needs to be a var for mutating func. Can only set value from withing struct
    
    // This just returns a new MovieModel, doesn't update the movie in MovieManager
    func updateFavoriteStatus(newValue: Bool) -> MovieModel {
      MovieModel(title: title, genre: genre, isFavorite: newValue)
    }
    mutating func updateFaveStatus(newValue: Bool) {
      isFavorite = newValue
    }
  }
  
  enum MovieGenre {
    case comedy, action, horror
  }
  
  class MovieManager {
    // All variables are default of public, you can get/set
    public var movie1 = MovieModel(title: "Avatar", genre: .action, isFavorite: false)
    var movie2 = MovieModel(title: "Step Brothers", genre: .comedy, isFavorite: false)
    
    // Set to private, can only access from within class
    private var movie3 = MovieModel(title: "Avengers", genre: .action, isFavorite: false)
    
    // BEST PRACTICE
    // For private(set), read is public, write is private
    private(set) var movie4 = MovieModel(title: "Shining", genre: .horror, isFavorite: false)
    
    func updateMovie4(isFavorite: Bool) {
      movie4.updateFaveStatus(newValue: isFavorite)
    }
  }
  
  func testAccess() {
    let manager = MovieManager()
    
    // Use updateFavoriteStatus() that returns a new struct
    let movie1 = manager.movie1.updateFavoriteStatus(newValue: true) // public access
    XCTAssertEqual(movie1.isFavorite, true)
    
    // Use updateFaveStatus() that mutates the struct instead of returning a new one
    manager.movie2.updateFaveStatus(newValue: true)
    XCTAssertEqual(manager.movie2.isFavorite, true)
    
    // BEST PRACTICE
    // movie4 is private(set), so have to use class method to update it, but can freely access it
    manager.updateMovie4(isFavorite: true)
    XCTAssertEqual(manager.movie4.isFavorite, true)
  }
  
  
  
  
  
  
}
  
  
