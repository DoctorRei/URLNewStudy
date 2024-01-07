//
//  LoginRouter.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//

import UIKit

protocol ILoginRouter: IBaseRouting {
    
}

final class LoginRouter {
    
    enum Target {
        case registerScene
        case randomImageScene
    }
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension LoginRouter: ILoginRouter {
    func routeTo(scene: Any) {
        guard let registerTarget = scene as? LoginRouter.Target else { return }
        
        switch registerTarget {
        case .registerScene:
            let registerVC = RegisterViewController()
            let registerAssembly = RegisterAssembly(navigationController: navigationController)
            registerAssembly.configure(viewController: registerVC)
            
            navigationController.pushViewController(registerVC, animated: true)
        case .randomImageScene:
            break
        }
        
        
    }
    
    
}
