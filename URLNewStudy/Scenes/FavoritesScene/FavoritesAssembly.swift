//
//  FavoritesAssembly.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import UIKit

final class FavoritesAssembly {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension FavoritesAssembly: BaseAssemblyProtocole {
    func configure(viewController: UIViewController) {
        guard let favoritesVC = viewController as? FavoritesViewController else {return}
        let router = FavoritesRouter(navigationController: navigationController)
        let storageManager = StorageManager.shared
        let worker = FavoritesWorker(storageManager: storageManager)
        let presenter = FavoritesPresenter(view: favoritesVC, router: router, storageManager: storageManager, worker: worker)
        
        favoritesVC.presenter = presenter
        presenter.view = favoritesVC
    }
    
    
}
