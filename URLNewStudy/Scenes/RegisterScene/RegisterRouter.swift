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
        case randomImageScene
    }
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension RegisterRouter: IRegisterRouter {
    func routeTo(scene: Any) {
        
    }
    
    
}
