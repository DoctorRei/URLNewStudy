//
//  RandomImagePresenter.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//

import UIKit

protocol RandomImagePresenterProtocole {
    func render()
    func saveToStorage()
    func renderWithKF(imageToWorker: UIImageView)
    func getUrlFromApi() -> String
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
    func render() {
        worker.getImage { image, url, data in
            self.imageID = UUID()
            self.imageURL = url
            self.ImageCoreData = data
            
            self.view.render(with: image)
        }
    }
    
    func saveToStorage() {
        if let id = imageID, let url = imageURL, let data = ImageCoreData {
            storageManager.createImage(with: id , url: url, Image: data)
        } else {
            print("Data nill")
        }
    }
    
    func renderWithKF(imageToWorker: UIImageView) {
        imageViewTest = imageToWorker
        worker.getImageFromKF(imageToVC: imageViewTest) { [weak self] image in
            self?.imageViewTest = image
            self?.view.renderKF(with: self?.imageViewTest ?? UIImageView())
        }
    }
    
    func getUrlFromApi() -> String {
            worker.getUrlFromApi { url in
                self.imageURL = url
            }
            return imageURL ?? ""
        }
    
}
