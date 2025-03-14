//
//  UserRepository.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 4.03.2025.
//

import Foundation
// User Repository can enable us to swap methods for fetching data or storing locally in-memory or persistent. Methods can be multiplied for purposes like deleting a user, updating, etc.
protocol UserRepository {
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void)
}


