//
//  SceneDelegate.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let appDependency = AppDependencyContainer()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        setupRootViewController()
    }
    
    private func setupRootViewController() {
        let rootVC = appDependency.makeRootViewController()
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
    }
}
