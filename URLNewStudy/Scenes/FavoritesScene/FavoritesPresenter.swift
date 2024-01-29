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
    func updateImages(with id: UUID)
}

final class FavoritesPresenter {
    weak var view: FavoritesViewControllerProtocole?
    private let router: IFavoritesRouter
    private let storageManager: StorageManagerProtocole
    
    var data: Girl?
    
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
    
    func updateImages(with id: UUID) {
        guard let imageFromCoreData = storageManager.fetchImage(id: id) else { return }
        view?.updateSource(with: imageFromCoreData)
    }
}
