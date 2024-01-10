//
//  LoginRouter.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//

import UIKit

protocol ILoginRouter: IBaseRouting {
    func routeTo(scene: Any)
    func showError(message: String)
}

final class LoginRouter {
    
    enum Target {
        case registerScene(name: String)
        case randomImageScene
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

extension LoginRouter: ILoginRouter {
    func routeTo(scene: Any) {
        guard let registerTarget = scene as? LoginRouter.Target else { return }
        
        switch registerTarget {
        
        case .registerScene(let name):
            let registerVC = RegisterViewController()
            let registerAssembly = RegisterAssembly(
                navigationController: navigationController,
                name: name)
            registerAssembly.configure(viewController: registerVC)
            
            navigationController.pushViewController(registerVC, animated: true)
        
        case .randomImageScene:
            let randomImageVC = RandomImageVC()
            let randomImageAssembly = RandomImageAssembly(navigationController: navigationController)
            randomImageAssembly.configure(viewController: randomImageVC)
            
            navigationController.pushViewController(randomImageVC, animated: true)
        }
    }
}
