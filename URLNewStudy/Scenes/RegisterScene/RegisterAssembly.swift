//
//  RegisterAssembly.swift
//  URLNewStudy
//
//  Created by Акира on 07.01.2024.
//

import UIKit

final class RegisterAssembly {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension RegisterAssembly: IBaseAssembly {
    func configure(viewController: UIViewController) {
        guard let registerVC = viewController as? RegisterViewController else { return }
        let router = RegisterRouter(navigationController: navigationController)
        let presenter = RegisterPresenter(view: registerVC, router: router)
         
        registerVC.presenter = presenter
    }
}
