//
//  RegisterAssembly.swift
//  URLNewStudy
//
//  Created by Акира on 07.01.2024.
//

import UIKit

final class RegisterAssembly {
    private let navigationController: UINavigationController
    private let name: String
    private let password: Data
    
    init(navigationController: UINavigationController, name: String, password: Data) {
        self.navigationController = navigationController
        self.name = name
        self.password = password
    }
}

extension RegisterAssembly: IBaseAssembly {
    func configure(viewController: UIViewController) {
        guard let registerVC = viewController as? RegisterViewController else { return }
        let router = RegisterRouter(navigationController: navigationController)
        let keychainManager = KeychainManager()
        let presenter = RegisterPresenter(router: router, view: registerVC, keychainManager: keychainManager, name: name, password: password, status: "")
         
        registerVC.presenter = presenter
    }
}
