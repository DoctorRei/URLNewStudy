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
        case selectedImage(images: [UIImage], index: Int)
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
        case .selectedImage(let images, let index):
            let selectedImageVC = SelectedImageViewController()
            let selectedImageAssembly = SelectedImageAssembly(
                navigationController: navigationController,
                selectedImages: images,
                selectedIndex: index
            )
            selectedImageAssembly.configure(viewController: selectedImageVC)
            
            navigationController.pushViewController(selectedImageVC, animated: true)
            
        case .mainScene:
            break
        }
    }
}
