
import Foundation
@testable import UserListMVVM

class MockUserRepository: UserRepositoryProtocol {
    func deleteUser(withId id: Int, completion: @escaping (Result<Void, any Error>) -> Void) {
        
    }
    
    func updateUser(_ user: UserListMVVM.User, completion: @escaping (Result<UserListMVVM.User, any Error>) -> Void) {
        
    }
    
    var shouldReturnError = false
    var numberOfUsers = 1 // Default to 1, can be changed for tests

    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NetworkError.noData))
        } else {
            let users = (1...numberOfUsers).map { index in
                User(id: index, name: "User \(index)", username: "user\(index)", email: "user\(index)@example.com",
                     address: Address(street: "Street \(index)", suite: "Apt \(index)", city: "City \(index)", zipcode: "Zip\(index)",
                                      geo: Geo(lat: "0.0", lng: "0.0")),
                     phone: "123-456-789\(index)", website: "user\(index).com",
                     company: Company(name: "Company \(index)", catchPhrase: "Test", bs: "Tech"))
            }
            completion(.success(users))
        }
    }
}



