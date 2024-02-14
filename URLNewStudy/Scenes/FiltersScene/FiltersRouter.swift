//
//  SettingsRouter.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import UIKit

protocol FiltersRouterProtocole: BaseRoutingProtocole  {
    
}

final class FiltersRouter {
    
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

extension FiltersRouter: FiltersRouterProtocole {
    func routeTo(scene: Any) {
        guard let filtersRouter = scene as? FiltersRouter.Target else {return}
        
        switch filtersRouter {
        case .updateArrayLinks:
            break
        case .mainScene:
            break
        }
    }
}
