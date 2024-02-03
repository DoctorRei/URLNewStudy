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
    func getFromStorage(with url: [String]) -> [UIImage]
}

final class FavoritesWorker {
    
    private let storageManager: StorageManager
    
    init(storageManager: StorageManager) {
        self.storageManager = storageManager
    }
}

extension FavoritesWorker: FavoritesWorkerProtocole {
    func getFromStorage(with url: [String]) -> [UIImage] {
        var likedImages: [UIImage] = []
        
        let group = DispatchGroup()
        
        url.forEach { urlIntoCache in
            group.enter()
            KingfisherManager.shared.cache.retrieveImageInDiskCache(forKey: urlIntoCache) { result in
                defer {
                    group.leave()
                }
                switch result {
                case .success(let image):
                    likedImages.append(image ?? UIImage())
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        group.wait()
        return likedImages
    }
}

