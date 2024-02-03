//
//  RandomImagePresenter.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//

import UIKit

protocol RandomImagePresenterProtocole {
    //    func saveToStorage()
    func deleteAll()
    func render(imageToWorker: UIImageView)
    func saveToStorage()
}

final class RandomImagePresenter {
    
    let router: RandomImageRouterProtocole
    private var worker: RandomImageWorkerProtocole
    private var storageManager: StorageManagerProtocole
    weak var view: IRandomImageVC!
    
    private var imageViewTest = UIImageView()
    private var urlToKF = Links.shinobu.url
    private var imageURL: String?
    
    init(
        router: RandomImageRouterProtocole,
        worker: RandomImageWorkerProtocole!,
        storageManager: StorageManagerProtocole,
        view: IRandomImageVC!
    ) {
        self.router = router
        self.worker = worker
        self.storageManager = storageManager
        self.view = view
    }
}

extension RandomImagePresenter: RandomImagePresenterProtocole {
    
    func render(imageToWorker: UIImageView) {
        imageViewTest = imageToWorker
        worker.getImageFromKF(imageToVC: imageViewTest) { [weak self] image, url  in
            self?.imageViewTest = image
            self?.imageURL = url
            self?.view.render(with: self?.imageViewTest ?? UIImageView())
        }
    }
    
    func saveToStorage() {
        guard let url = imageURL else {
            print("Cache empty")
            return
        }
        worker.saveToStorage(with: url, likedImage: imageViewTest)
        
    }
    
    func deleteAll() {
        storageManager.deleteAllImages()
    }
}
