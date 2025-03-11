//
//  APIUserRepository.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 4.03.2025.
//

import Foundation


// API User Repository makes a simple call for our controller to display data through User Service whose instance we use in the viewModel for UsersListVC.
final class UserRepository: UserRepositoryProtocol {

    private let coreDataManager: CoreDataManagerProtocol
    
    private let apiClient: APIClientProtocol
//    private let coreDataManager: CoreDataManagerProtocol

    init(apiClient: APIClientProtocol, coreDataManager: CoreDataManagerProtocol) {
        self.apiClient = apiClient
        self.coreDataManager = coreDataManager
    }

    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        apiClient.fetch(endpoint: "users", completion: completion)
    }
    
    func saveUsers(_ users: [User]) {
        
    }
    
    func deleteUser(withId id: Int, completion: @escaping (Result<Void, any Error>) -> Void) {
        
    }
    
    func updateUser(_ user: User, updatedUser: User, completion: @escaping (Result<User, any Error>) -> Void) {
        
    }
   
   
}
