//
//  RandomImagePresenter.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//

import UIKit

protocol RandomImagePresenterProtocole {
    func saveToStorage()
    func deleteAll()
    func render(imageToWorker: UIImageView)
}

final class RandomImagePresenter {
    
    let router: RandomImageRouterProtocole
    private var worker: RandomImageWorkerProtocole!
    private var storageManager: StorageManagerProtocole
    weak var view: IRandomImageVC!
    
    private var imageViewTest = UIImageView()
    private var urlToKF = Links.shinobu.url
    private var imageID: UUID?
    private var imageURL: String?
    private var ImageCoreData: Data?
    
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
//    func render() {
//        worker.getImage { image, url, data in
//            self.imageID = UUID()
//            self.imageURL = url
//            self.ImageCoreData = data
//
//            self.view.render(with: image)
//        }
//    }
    
    func deleteAll() {
        storageManager.deleteAllImages()
    }
    
    func saveToStorage() {
        if let id = imageID, let url = imageURL, let data = ImageCoreData {
            storageManager.createImage(with: id , url: url, Image: data)
        } else {
            print("Data nill")
        }
    }
    
    func render(imageToWorker: UIImageView) {
        imageViewTest = imageToWorker
        worker.getImageFromKF(imageToVC: imageViewTest) { [weak self] image in
            self?.imageViewTest = image
            self?.view.render(with: self?.imageViewTest ?? UIImageView())
        }
    }
}
