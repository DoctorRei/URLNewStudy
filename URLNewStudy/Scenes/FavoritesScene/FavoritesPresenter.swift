//
//  FavoritesPresenter.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import Foundation

protocol IFavoritesPresenter {
    func render()
}

final class FavoritesPresenter {
    weak var view: IFavoritesViewController?
    private let router: IFavoritesRouter
    
    init(router: IFavoritesRouter) {
        self.router = router
    }
}

extension FavoritesPresenter: IFavoritesPresenter {
    func render() {
        
    }
}
