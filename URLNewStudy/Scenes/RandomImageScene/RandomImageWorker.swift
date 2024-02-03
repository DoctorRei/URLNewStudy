//
//  RandomImageRender.swift
//  URLNewStudy
//
//  Created by Акира on 18.01.2024.
//

import UIKit
import Kingfisher

protocol RandomImageWorkerProtocole {
    func getImage(completion: @escaping (UIImage, String, Data) -> Void)
    func getImageFromKF(imageToVC: UIImageView, completion: @escaping (UIImageView, String) -> Void)
    func getUrlFromApi(completion: @escaping (String) -> Void)
    func saveToStorage(with url: String, likedImage: UIImageView)
    func getFromStorage(with url: String, completion: @escaping (UIImage) -> Void)
    
}

final class RandomImageWorker {
    
    private let networkManager: NetworkManagerProtocole
    private let storageManager: StorageManager
    
    init(networkManager: NetworkManagerProtocole, storageManager: StorageManager) {
        self.networkManager = networkManager
        self.storageManager = storageManager
    }
}

extension RandomImageWorker: RandomImageWorkerProtocole {
    func getImage(completion: @escaping (UIImage, String, Data) -> Void) {
        //TODO: - Сделать метод, который принимает Set() с юрлами и вкидывает их сюда
        let url = Links.shinobu.url // пока заглушка, в идеале реализовать фильтры по картинкам
        
        DispatchQueue.global().sync {
            networkManager.fetch(JsonForPictures.self, from: url) { data in
                switch data {
                case .success(let imageFromUrl):
                    self.networkManager.downloadImage(with: imageFromUrl.url) { downloadedImage in
                        guard let image = UIImage(data: downloadedImage) else { return }
                        DispatchQueue.global().sync {
                            completion(image, imageFromUrl.url, downloadedImage)
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}


extension RandomImageWorker {
    
    func getUrlFromApi(completion: @escaping (String) -> Void) {
        let apiLink = Links.shinobu.url
        
        DispatchQueue.global().sync {
            networkManager.fetch(JsonForPictures.self, from: apiLink) { url in
                switch url {
                case .success(let url):
                    completion(url.url)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func getImageFromKF(imageToVC: UIImageView, completion: @escaping (UIImageView, String) -> Void) {
        getUrlFromApi { urlImage in
            guard let defaultURL = URL(string: "https://sun9-19.userapi.com/impg/t_fEO35dURufOivHNYcPN9k8BJrnD5PlfV76IQ/VK3nAtHWRLs.jpg?size=810x1080&quality=96&sign=ef13cb5692320947667d494e5c58730f&type=album") else { return }
            let resource = KF.ImageResource(downloadURL: URL(string: urlImage) ?? defaultURL)
            let processor = DefaultImageProcessor()
            
            imageToVC.kf.indicatorType = .activity
            imageToVC.kf.setImage(with: resource, options: [.processor(processor)]) { receivedSize, totalSize in
                let percentage = Float(receivedSize) / Float(totalSize) * 100.0
                print("Download is \(percentage)")
            } completionHandler: { (result) in
                self.hande(result)
            }
            completion(imageToVC, urlImage)
        }
    }
    
    
    func hande(_ result: Result<RetrieveImageResult, KingfisherError>) {
        switch result {
        case .success(let downloadedImage):
            let image = downloadedImage.image
            let cacheType = downloadedImage.cacheType
            let source = downloadedImage.source
            let originalSource = downloadedImage.originalSource
            print("Image size: \(image.size), Cache: \(cacheType), Source: \(source), Original Source: \(originalSource)")
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
    func saveToStorage(with url: String, likedImage: UIImageView) {
        guard let imageToSave = likedImage.image else { return }
        KingfisherManager.shared.cache.store(imageToSave, forKey: url)
        storageManager.createImage(url: url)
        print("Сейв сработал")
    }
    
    func getFromStorage(with url: String, completion: @escaping (UIImage) -> Void) {
        KingfisherManager.shared.cache.retrieveImageInDiskCache(forKey: url) { result in
            switch result {
            case .success(let image):
                completion(image ?? UIImage())
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
