//
//  UserViewModel.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 4.03.2025.
//

import Foundation

// ViewModel Protocol makes the code flexible for testing with mock data.
protocol UserViewModelProtocol {
    var users: [User] { get }
    var onUsersUpdated: (() -> Void)? { get set }
    var onError: ((String?) -> Void)? { get set }
    func fetchUsers()
    func deleteUser(withId id: Int)
    func updateUser(_ user: User, updatedUser: User)
}


final class UserViewModel: UserViewModelProtocol {
 
    private let userService: UserServiceProtocol
    private let coreDataManager: CoreDataManagerProtocol
    
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
    
    init(userService: UserService, coreDataManager: CoreDataManagerProtocol) {
        self.userService = userService
        self.coreDataManager = coreDataManager
    }
    
    func deleteUser(withId id: Int) {
        users.removeAll { $0.id == id }
        saveToCoreData(users: users)
    }
    
    func updateUser(_ user: User, updatedUser: User) {
        
        if let index = users.firstIndex(where: { $0.id == user.id }) {
            users[index] = updatedUser
            saveToCoreData(users: users)
        }
        
    }
    
    
    func fetchUsers() {
        let localData = coreDataManager.fetchEntities(ofType: UserEntity.self)
        
        if localData.isEmpty {
            userService.fetchUsers { [weak self] result in
                guard let self = self else {return}
                switch result {
                case .success(let users):
                    self.users = users
                    self.saveToCoreData(users: users)
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        } else {
            users = savedUsers(usersEntity: localData)
        }
    
    }
    
    func saveToCoreData(users: [User]) {
        users.forEach { $0.saveToCoreData(context: coreDataManager.context) }
    }
    
    func savedUsers(usersEntity: [UserEntity]) -> [User] {
        usersEntity.map { $0.toModel() }
    }
    
    
 
}
