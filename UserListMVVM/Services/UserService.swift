//
//  UserService.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 4.03.2025.
//

import Foundation

protocol UserServiceProtocol {
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void)
}

final class UserService: UserServiceProtocol {
    
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        repository.fetchUsers(completion: completion)
    }
    
}
