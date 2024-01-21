//
//  SceneDelegate.swift
//  URLNewStudy
//
//  Created by Акира on 22.12.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        
        let loginVC = LoginViewController()
        let navigationController = UINavigationController(rootViewController: loginVC)
        let loginAssembly = LoginAssembly(navigationController: navigationController)
        loginAssembly.configure(viewController: loginVC)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
