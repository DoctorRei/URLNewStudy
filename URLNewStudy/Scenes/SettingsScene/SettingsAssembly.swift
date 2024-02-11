//
//  SettingsAssembly.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import UIKit

final class SettingsAssembly {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension SettingsAssembly: BaseAssemblyProtocole {
     func configure(viewController: UIViewController) {
        guard let settingsVC = viewController as? SettingsViewController else { return}
        
        let router = SettingsRouter(navigationController: navigationController)
        let userDefaultsManager = UserDefaultsManager()
        let presenter = SettingsPresenter(
            router: router,
            userDefaultsManager: userDefaultsManager)
        
        settingsVC.presenter = presenter
        presenter.view = settingsVC
    }    
}


