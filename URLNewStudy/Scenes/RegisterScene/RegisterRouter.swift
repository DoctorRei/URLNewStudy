//
//  RegisterRouter.swift
//  URLNewStudy
//
//  Created by Акира on 07.01.2024.
//

import UIKit

protocol IRegisterRouter {
    
}

final class RegisterRouter {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension RegisterRouter: ILoginRouter {
    
}
