//
//  RandomImagePresenter.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//

import UIKit

protocol RandomImagePresenterProtocole {
    func deleteAll()
    func render(imageToWorker: UIImageView)
    func saveToStorage()
    func animateLikeImage(with image: UIImageView)
}

final class RandomImagePresenter {
    
    let router: RandomImageRouterProtocole
    weak var view: RandomImageViewControllerProtocole!
    private var worker: RandomImageWorkerProtocole
    private var storageManager: StorageManagerProtocole
    private var userDefaultsManager: UserDefaultsManagerProtocole
    
    private var downloadedImageView = UIImageView()
    private var imageURL: String?
    
    init(
        router: RandomImageRouterProtocole,
        worker: RandomImageWorkerProtocole!,
        storageManager: StorageManagerProtocole,
        view: RandomImageViewControllerProtocole!,
        userDefaultsManager: UserDefaultsManagerProtocole
    ) {
        self.router = router
        self.worker = worker
        self.storageManager = storageManager
        self.view = view
        self.userDefaultsManager = userDefaultsManager
    }
}

extension RandomImagePresenter: RandomImagePresenterProtocole {
    
    func render(imageToWorker: UIImageView) {
        downloadedImageView = imageToWorker
        worker.getImageFromKF(imageToVC: downloadedImageView) { [weak self] image, url  in
            self?.downloadedImageView = image
            self?.imageURL = url
            self?.view.render(with: self?.downloadedImageView ?? UIImageView())
        }
    }
    
    func saveToStorage() {
        guard let url = imageURL else {
            print("Cache empty")
            return
        }
        worker.saveToStorage(with: url, likedImage: downloadedImageView)
    }
    
    func animateLikeImage(with image: UIImageView) {
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut) {
            image.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
                image.alpha = 0
                image.transform = .identity
            }
        }
    }
    
    func deleteAll() {
        storageManager.deleteAllImages()
    }
}

