//
//  FavoritesAssembly.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import Foundation
import UIKit

final class FavoritesAssembly {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension FavoritesAssembly: IBaseAssembly {
     func configure(viewController: UIViewController) {
        guard let favoritesVC = viewController as? FavoritesViewController else {return}
        let router = FavoritesRouter(navigationController: navigationController)
        let presenter = FavoritesPresenter(router: router)
        
        favoritesVC.presenter = presenter
        presenter.view = favoritesVC
    }
    
    
}