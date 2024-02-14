//
//  SettingsAssembly.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import UIKit

final class FiltersAssembly {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension FiltersAssembly: BaseAssemblyProtocole {
     func configure(viewController: UIViewController) {
        guard let settingsVC = viewController as? FiltersViewController else { return}
        
        let router = FiltersRouter(navigationController: navigationController)
        let userDefaultsManager = UserDefaultsManager()
        let presenter = FiltersPresenter(
            router: router,
            userDefaultsManager: userDefaultsManager)
        
        settingsVC.presenter = presenter
        presenter.view = settingsVC
    }    
}


