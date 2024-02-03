//
//  FavoritesWorker.swift
//  URLNewStudy
//
//  Created by Акира on 26.01.2024.
//

import Foundation
import Kingfisher
import UIKit

protocol FavoritesWorkerProtocole {
    
}

final class FavoritesWorker {
    
    private let networkManager: NetworkManagerProtocole
    
    init(networkManager: NetworkManagerProtocole) {
        self.networkManager = networkManager
    }
}

extension FavoritesWorker {
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

