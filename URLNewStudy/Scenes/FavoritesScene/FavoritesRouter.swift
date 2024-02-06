//
//  FavoritesRouter.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import UIKit

protocol FavoritesRouterProtocole: BaseRoutingProtocole {
    
}

final class FavoritesRouter {
    
    enum Target {
        case selectedImage
        case mainScene
    }
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

//TODO: - Заглушка навигации

extension FavoritesRouter: FavoritesRouterProtocole {
    func routeTo(scene: Any) {
        guard let favoritesTarget = scene as? FavoritesRouter.Target else {return}
        
        switch favoritesTarget {
        case .selectedImage:
            break
        case .mainScene:
            break
        }
    }
}
