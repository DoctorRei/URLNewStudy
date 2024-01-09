//
//  RegisterRouter.swift
//  URLNewStudy
//
//  Created by Акира on 07.01.2024.
//

import UIKit

protocol IRegisterRouter: IBaseRouting  {
    
}

final class RegisterRouter {
    
    enum Target {
        case loginScene
        case randomImgScene
    }
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension RegisterRouter: IRegisterRouter {
    func routeTo(scene: Any) {
        guard let registerTarget = scene as? RegisterRouter.Target else {return}
        
        switch registerTarget {
        case .loginScene:
            break
        case .randomImgScene:
            let randomImageVC = RandomImageVC()
            let randomImageAssembly = RandomImageAssembly(navigationController: navigationController)
            randomImageAssembly.configure(viewController: randomImageVC)
            
            navigationController.pushViewController(randomImageVC, animated: true)
        }
    }
}
