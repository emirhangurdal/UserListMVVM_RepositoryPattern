//
//  SceneDelegate.swift
//  UserListMVVM
//
//  Created by Emir Gurdal on 4.03.2025.
//

import Foundation
import UIKit
// Using Dependency Injection for root controller.
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    let coreDataManager = CoreDataManager()
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        let appCoordinator = AppCoordinator(window: window, coreDataManager: coreDataManager)
        appCoordinator.start()
        self.window = window
    }
    func sceneDidEnterBackground(_ scene: UIScene) {
        coreDataManager.saveContext()
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        coreDataManager.saveContext()
    }
}
