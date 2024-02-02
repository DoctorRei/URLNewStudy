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
    func getImageFromKF(imageUrl: URL, completion: @escaping (UIImageView) -> Void)
}

final class RandomImageWorker {
    
    private let networkManager: NetworkManagerProtocole
    
    init(networkManager: NetworkManagerProtocole) {
        self.networkManager = networkManager
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
    func getImageFromKF(imageUrl: URL, completion: @escaping (UIImageView) -> Void) {
        var randomPicture = UIImageView()

        let resource = KF.ImageResource(downloadURL: imageUrl)
        let placeholder = UIImage(named: "forXCode2")

        randomPicture.kf.setImage(
            with: resource,
            placeholder: placeholder) { receivedSize, totalSize in
                let percentage = Float(receivedSize) / Float(totalSize) * 100.0
                print("Download is \(percentage)")
            } completionHandler: { result in
                self.hande(result)
            }
        completion(randomPicture)
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
}
