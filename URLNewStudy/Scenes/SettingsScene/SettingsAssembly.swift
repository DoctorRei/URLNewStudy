//
//  GlobalSettingsAssembly.swift
//  URLNewStudy
//
//  Created by Акира on 14.02.2024.
//

import UIKit

class SettingsAssembly {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension SettingsAssembly: BaseAssemblyProtocole {
    func configure(viewController: UIViewController) {
        guard let settingsVC = viewController as? SettingsViewController else { return }
        
        let router = SettingsRouter(navigationController: navigationController)
        let presenter = SettingsPresenter(router: router)
        
        settingsVC.presenter = presenter
        presenter.view = settingsVC
    }
}
