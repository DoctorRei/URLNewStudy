//
//  FavoritesRouter.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import UIKit

protocol IFavoritesRouter: BaseRoutingProtocole {
    
}

final class FavoritesRouter {
    
    enum Target {
        case favoritesVC
        case mainScene
    }
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

//TODO: - Заглушка навигации

extension FavoritesRouter: IFavoritesRouter {
    func routeTo(scene: Any) {
        guard let randomImageTarget = scene as? RandomImageRouter.Target else {return}
        
        switch randomImageTarget {
        case .favoritesVC:
            break
        case .mainScene:
            break
        }
    }
}
