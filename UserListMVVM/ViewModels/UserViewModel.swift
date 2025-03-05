//
//  UserViewModel.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 4.03.2025.
//

import Foundation

protocol UserViewModelProtocol {
    var users: [User] { get }
    var onUsersUpdated: (() -> Void)? { get set }
    var onError: ((String?) -> Void)? { get set }
    func fetchUsers()
}

// ViewModel Protocol makes the code testable with mock data. 
final class UserViewModel: UserViewModelProtocol {
 
    private let userService: UserServiceProtocol
    
    var users: [User] = [] {
        didSet {
            onUsersUpdated?()
        }
    }
    
    var errorMessage: String? {
        didSet {
            onError?(errorMessage)
        }
    }
    
    var onUsersUpdated: (() -> Void)?
    var onError: ((String?) -> Void)?
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func fetchUsers() {
        userService.fetchUsers { [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
        }
    }
}
