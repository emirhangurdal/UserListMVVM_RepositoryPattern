//
//  UserService.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 4.03.2025.
//

import Foundation

final class UserService: UserServiceProtocol {
   
    private let repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        repository.fetchUsers(completion: completion)
    }
    
}
