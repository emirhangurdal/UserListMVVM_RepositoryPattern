
import Foundation
@testable import UserListMVVM

class MockUserRepository: UserRepository {
    var shouldReturnError = false

    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NetworkError.noData))
        } else {
            completion(.success([User(id: 1, name: "John Doe", username: "johndoe", email: "john@example.com",
                                      address: Address(street: "123 St", suite: "Apt 1", city: "New York", zipcode: "10001",
                                                       geo: Geo(lat: "0.0", lng: "0.0")),
                                      phone: "123-456-7890", website: "example.com",
                                      company: Company(name: "Example Inc", catchPhrase: "Test", bs: "Tech"))]))
        }
    }
}


