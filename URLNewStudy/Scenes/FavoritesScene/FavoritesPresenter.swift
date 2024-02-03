//
//  FavoritesPresenter.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import Foundation
import UIKit

protocol FavoritesPresenterProtocole {
    func render()
    func loadLikedImages() -> [UIImage]
}

final class FavoritesPresenter {
    weak var view: FavoritesViewControllerProtocole?
    private let router: FavoritesRouterProtocole
    private let storageManager: StorageManagerProtocole
    private let worker: FavoritesWorkerProtocole
    
    init(
        view: FavoritesViewControllerProtocole,
        router: FavoritesRouterProtocole,
        storageManager: StorageManagerProtocole,
        worker: FavoritesWorkerProtocole) {
            self.view = view
            self.router = router
            self.storageManager = storageManager
            self.worker = worker
        }
}

extension FavoritesPresenter: FavoritesPresenterProtocole {
    func render() {
    }
    
    func loadLikedImages() -> [UIImage] {
        let urlKeys = storageManager.fetchImages()
        let urls = urlKeys.compactMap { $0.url }
        
        let imagesToCollection = worker.getFromStorage(with: urls)
        return imagesToCollection
    }
    
    func loadImagesFromKF() {
        
    }
}
