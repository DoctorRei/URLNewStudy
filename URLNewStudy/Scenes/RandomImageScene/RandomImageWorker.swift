//
//  RandomImageRender.swift
//  URLNewStudy
//
//  Created by Акира on 18.01.2024.
//

import Foundation
import UIKit

protocol IRandomImageWorker {
    func getImage(completion: @escaping (UIImage) -> Void)
}

final class RandomImageWorker {
    
    private let networkManager: INetworkManager
    
    init(networkManager: INetworkManager) {
        self.networkManager = networkManager
    }
}

extension RandomImageWorker: IRandomImageWorker {
    func getImage(completion: @escaping (UIImage) -> Void) {
        //TODO: - Сделать метод, который принимает Set() с юрлами и вкидывает их сюда
        let url = Links.shinobu.url // пока заглушка, в идеале реализовать фильтры по картинкам
        
        DispatchQueue.global().sync {
            networkManager.fetch(JsonForPictures.self, from: url) { data in
                switch data {
                case .success(let imageFromUrl):
                    self.networkManager.downloadImage(with: imageFromUrl.url) { downloadedImage in
                        guard let image = UIImage(data: downloadedImage) else { return}
                        DispatchQueue.global().sync {
                            completion(image)
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
