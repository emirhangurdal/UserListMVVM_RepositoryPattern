//
//  UserViewModel.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 4.03.2025.
//

import Foundation
// ViewModel can be used for business logic in the view controller. Displaying data on a Table View, updating the UI when necessary using simple completion blocks. 
final class UserViewModel {
    
    private let userService: UserService
    
    var users: [User] = [] {
        didSet {
            onUsersUpdated?()
        }
    }
    
    var errorMessage: String? {
        didSet {
            onError?()
        }
    }
    
    var onUsersUpdated: (() -> Void)?
    var onError: (() -> Void)?
    
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
