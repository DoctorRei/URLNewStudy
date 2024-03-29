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
        case selectedImage(image: [String], index: Int)
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
        case .selectedImage(let image, let index):
            let selectedImageVC = SelectedImageViewController()
            let selectedImageAssembly = SelectedImageAssembly(
                navigationController: navigationController,
                selectedImages: image,
                selectedIndex: index
            )
            selectedImageAssembly.configure(viewController: selectedImageVC)
            navigationController.pushWithNewAnimation(controller: selectedImageVC)
        case .mainScene:
            break
        }
    }
}
