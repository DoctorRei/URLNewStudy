//
//  LoginRouter.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//

import UIKit

protocol LoginRouterProtocole: BaseRoutingProtocole {
    func routeTo(scene: Any)
    func showError(message: String)
}

final class LoginRouter {
    
    enum Target {
        case registerScene(name: String, password: Data)
        case tabBarController
    }
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension LoginRouter {
    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let actionDone = UIAlertAction(title: "Ok", style: .default)
        let actionRegister = UIAlertAction(title: "Register", style: .default)
        
        alert.addAction(actionDone)
        alert.addAction(actionRegister)
        
        navigationController.topViewController?.present(alert, animated: true)
    }
}

extension LoginRouter: LoginRouterProtocole {
    func routeTo(scene: Any) {
        guard let registerTarget = scene as? LoginRouter.Target else { return }
        
        switch registerTarget {
            
        case .registerScene(let name, let password):
            let registerVC = RegisterViewController()
            let registerAssembly = RegisterAssembly(
                navigationController: navigationController,
                name: name,
                password: password)
            registerAssembly.configure(viewController: registerVC)
            
            navigationController.pushViewController(registerVC, animated: true)
            
        case .tabBarController:
            let tabBarVC = TabBarView()
            let tabBarAssembly = TabBarAssembly(navigationController: navigationController)
            tabBarAssembly.configure(viewController: tabBarVC)
            
            navigationController.pushViewController(tabBarVC, animated: true)
        }
    }
}

