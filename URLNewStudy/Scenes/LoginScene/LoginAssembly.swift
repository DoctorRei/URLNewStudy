//
//  LoginAssembly.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//


import UIKit

final class LoginAssembly {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension LoginAssembly: IBaseAssembly {
    
    func configure(viewController: UIViewController) {
        guard let loginVC = viewController as? LoginViewController else {return}
        let keychainManager = KeychainManager()
        
        let router = LoginRouter(navigationController: navigationController)
        let worker = LoginWorker()
        let presenter = LoginPresenter(router: router, worker: worker, keychainManager: keychainManager)
        loginVC.loginPresenter = presenter
        presenter.view = loginVC
    }
    
}
