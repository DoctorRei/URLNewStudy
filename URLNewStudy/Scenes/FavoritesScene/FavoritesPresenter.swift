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
    func uploadImages(completion: @escaping ([UIImage]) -> Void)
    func runSelectedImage(with selectedImage: [UIImage], at indexPath: Int)
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
    
    //MARK: - Download Images
    
    func testCache(completion: @escaping ([String]) -> Void) {
        let urlKeys = storageManager.fetchImages()
        let urls = urlKeys.compactMap { $0.url }
        
        completion(urls)
    }
    
    func uploadImages(completion: @escaping ([UIImage]) -> Void) {
        testCache { cache in
            var arrayImages: [UIImage] = []
            cache.forEach { url in
                KingfisherManager.shared.cache.retrieveImage(forKey: url) { result in
                    switch result {
                    case .success(let imageFromCache):
                        arrayImages.append(imageFromCache.image ?? UIImage())
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
            completion(arrayImages)
        }
    }
    
    //MARK: - Navigation
    
    func runSelectedImage(with selectedImage: [UIImage], at indexPath: Int) {
        router.routeTo(scene: FavoritesRouter.Target.selectedImage(images: selectedImage, index: indexPath))
    }
    
}
