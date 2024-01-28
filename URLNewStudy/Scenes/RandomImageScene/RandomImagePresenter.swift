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
}

final class RandomImagePresenter {
    
    let router: IRandomImageRouter
    private var worker: IRandomImageWorker!
    private var storageManager: StorageManagerProtocole
    weak var view: IRandomImageVC!
    
    private var imageID: UUID?
    private var imageURL: String?
    private var ImageCashe: Data?
    
    init(
        router: IRandomImageRouter,
        worker: IRandomImageWorker!,
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
            self.ImageCashe = data
            
            self.view.render(with: image)
        }
    }
    
    func saveToStorage() {
        if let id = imageID, let url = imageURL, let data = ImageCashe {
            storageManager.createImage(with: id , url: url, Image: data)
        } else {
            print("Data nill")
        }
    }
}

