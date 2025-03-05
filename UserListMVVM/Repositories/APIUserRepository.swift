//
//  APIUserRepository.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 4.03.2025.
//

import Foundation
// API User Repository makes a simple call for our controller to display data through User Service whose instance we use in the viewModel for UsersListVC. 
final class APIUserRepository: UserRepository {
    
    
       
    private let apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        apiClient.fetch(endpoint: "users", completion: completion)
    }
   
}
