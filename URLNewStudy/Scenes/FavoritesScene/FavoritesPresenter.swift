//
//  FavoritesPresenter.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import Foundation
import UIKit
import Kingfisher

protocol FavoritesPresenterProtocole {
    func render()
    func runSelectedImage(with selectedImage: [String], at indexPath: Int)
    func getLikedGirlsUrls() -> [String]
}

final class FavoritesPresenter {
    weak var view: FavoritesViewControllerProtocole?
    private let router: FavoritesRouterProtocole
    private let storageManager: StorageManagerProtocole
    private var source: [String] = []

    init(
        view: FavoritesViewControllerProtocole,
        router: FavoritesRouterProtocole,
        storageManager: StorageManagerProtocole) {
            self.view = view
            self.router = router
            self.storageManager = storageManager
        }
}

extension FavoritesPresenter: FavoritesPresenterProtocole {
    func render() {
    }
    
    //MARK: - Download Images
    
    func getLikedGirlsUrls() -> [String] {
        let urlKeys = storageManager.fetchImages()
        source = urlKeys.compactMap { $0.url }
        
        return source
    }
    
    //MARK: - Navigation
    
    func runSelectedImage(with selectedImage: [String], at indexPath: Int) {
        router.routeTo(scene: FavoritesRouter.Target.selectedImage(image: selectedImage, index: indexPath))
    }
    
}
