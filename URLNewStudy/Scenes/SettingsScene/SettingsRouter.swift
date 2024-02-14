//
//  GlobalSettingsRouter.swift
//  URLNewStudy
//
//  Created by Акира on 14.02.2024.
//

import UIKit

protocol SettingsRouterProtocole: BaseRoutingProtocole {
    
}

final class SettingsRouter {
    
    enum Target {
        case backToLoginScene
        case filtersScene
    }
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}

extension SettingsRouter: SettingsRouterProtocole {
    func routeTo(scene: Any) {
        guard let settingsRouter = scene as? SettingsRouter.Target else {return}
        
        switch settingsRouter {
        case .backToLoginScene:
            navigationController.popToRootViewController(animated: true)
        case .filtersScene:
            break
        }
    }
    
}
