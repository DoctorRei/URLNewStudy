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
        let storageManager = StorageManager.shared
        let worker = SettingsWorker(storageManager: storageManager)
        let presenter = SettingsPresenter(router: router, worker: worker)
        
        settingsVC.presenter = presenter
        presenter.view = settingsVC
    }
}
