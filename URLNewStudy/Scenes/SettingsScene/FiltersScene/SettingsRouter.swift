//
//  SettingsRouter.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import UIKit

protocol SettingsRouterProtocole: BaseRoutingProtocole  {
    
}

final class SettingsRouter {
    
    enum Target {
        case updateArrayLinks
        case mainScene
    }
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

//TODO: - Заглушка навигации

extension SettingsRouter: SettingsRouterProtocole {
    func routeTo(scene: Any) {
        guard let settingsRouter = scene as? SettingsRouter.Target else {return}
        
        switch settingsRouter {
        case .updateArrayLinks:
            break
        case .mainScene:
            break
        }
    }
}
