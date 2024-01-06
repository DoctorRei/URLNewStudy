//
//  LoginRouter.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//

import UIKit

protocol ILoginRouter {
    
}

class LoginRouter {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension LoginRouter: ILoginRouter {
    
}
