//
//  FavoritesPresenter.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import Foundation

protocol FavoritesPresenterProtocole {
    func render()
    func loadLikedImages() -> [Girl]
}

final class FavoritesPresenter {
    weak var view: FavoritesViewControllerProtocole?
    private let router: IFavoritesRouter
    private let storageManager: StorageManagerProtocole
    
    init(router: IFavoritesRouter, storageManager: StorageManagerProtocole, view: FavoritesViewControllerProtocole) {
        self.router = router
        self.storageManager = storageManager
        self.view = view
    }
}

extension FavoritesPresenter: FavoritesPresenterProtocole {
    func render() {
    }
    
    func loadLikedImages() -> [Girl] {
        storageManager.fetchImages()
    }
    
}
