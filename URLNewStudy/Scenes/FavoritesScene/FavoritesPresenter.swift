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
    func runSelectedImage(with selectedImage: [UIImage], at indexPath: Int)
    func testCache(completion: @escaping ([String]) -> Void)
}

final class FavoritesPresenter {
    weak var view: FavoritesViewControllerProtocole?
    private let router: FavoritesRouterProtocole
    private let storageManager: StorageManagerProtocole

    
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
    
    func testCache(completion: @escaping ([String]) -> Void) {
        let urlKeys = storageManager.fetchImages()
        let urls = urlKeys.compactMap { $0.url }
        
        completion(urls)
    }
    
    //MARK: - Navigation
    
    func runSelectedImage(with selectedImage: [UIImage], at indexPath: Int) {
        router.routeTo(scene: FavoritesRouter.Target.selectedImage(images: selectedImage, index: indexPath))
    }
    
}
