//
//  UserRepository.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 6.03.2025.
//

import Foundation
// User Repository can enable us to swap methods for fetching data or storing locally in-memory or persistent. Methods can be multiplied for purposes like deleting a user, updating, etc.
protocol UserRepositoryProtocol {
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void)
    func saveUsers(_ users: [User])
    func deleteUser(withId id: Int, completion: @escaping (Result<Void, Error>) -> Void)
    func updateUser(_ user: User, updatedUser: User, completion: @escaping (Result<User, Error>) -> Void)
}
