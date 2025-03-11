//
//  AppCoordinator.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 5.03.2025.
//

import Foundation
import UIKit
// Applying single responsibility principle keeping SceneDelegate focused on life cycle only.
class AppCoordinator {
    private let window: UIWindow
    private let coreDataManager: CoreDataManagerProtocol
    
    init(window: UIWindow, coreDataManager: CoreDataManagerProtocol) {
        self.window = window
        self.coreDataManager = coreDataManager
    }
    
    func start() {
        let userRepository = UserRepository(apiClient: APIClient(), coreDataManager: coreDataManager)
        let userService = UserService(repository: userRepository)
        let userViewModel = UserViewModel(userService: userService, coreDataManager: coreDataManager)
        let userVC = UserListVC(viewModel: userViewModel)
        let rootNav = UINavigationController(rootViewController: userVC)
        window.rootViewController = rootNav
        window.makeKeyAndVisible()
    }
}
