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
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let userRepository = APIUserRepository(apiClient: APIClient())
        let userService = UserService(repository: userRepository)
        let userViewModel = UserViewModel(userService: userService)
        let userVC = UserListVC(viewModel: userViewModel)
        let rootNav = UINavigationController(rootViewController: userVC)
        window.rootViewController = rootNav
        window.makeKeyAndVisible()
    }
}
