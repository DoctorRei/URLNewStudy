//
//  RandomImageRouter.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//

import UIKit

protocol RandomImageRouterProtocole: BaseRoutingProtocole  {
    func routeTo(scene: Any)
    func updateSources(with id: UUID)
}

final class RandomImageRouter {
    
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

extension RandomImageRouter: RandomImageRouterProtocole {
    func routeTo(scene: Any) {
        guard let randomImageTarget = scene as? RandomImageRouter.Target else {return}
        
        switch randomImageTarget {
        case .favoritesVC:
            break
        case .mainScene:
            break
        }
    }
    
    func updateSources(with id: UUID) {
        let favorites = FavoritesViewController()
        let router = FavoritesRouter(navigationController: navigationController)
        let storageManager = StorageManager.shared
        let presenter = FavoritesPresenter(router: router, storageManager: storageManager, view: favorites)
        
        presenter.view = favorites
        favorites.presenter = presenter
        
        presenter.updateImages(with: id)
    }
}
