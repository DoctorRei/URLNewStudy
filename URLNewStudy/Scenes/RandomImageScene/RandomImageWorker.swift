//
//  RandomImageRender.swift
//  URLNewStudy
//
//  Created by Акира on 18.01.2024.
//

/// В этом классе мы реализовывем работу с сетью и сохранением в базу данных информацию о
/// картинках, которые мы загружаем из сети

import UIKit
import Kingfisher

protocol RandomImageWorkerProtocole {
    func getImageFromKF(imageToVC: UIImageView, completion: @escaping (UIImageView, String) -> Void)
    func getUrlFromApi(completion: @escaping (String) -> Void)
    func saveToStorage(with url: String, likedImage: UIImageView)
}

final class RandomImageWorker {
    
    private let networkManager: NetworkManagerProtocole
    private let storageManager: StorageManagerProtocole
    private let userDefaultsManager: UserDefaultsManagerProtocole
    
    init(
        networkManager: NetworkManagerProtocole,
        storageManager: StorageManagerProtocole,
        userDefaultsManager: UserDefaultsManagerProtocole
    ) {
        self.networkManager = networkManager
        self.storageManager = storageManager
        self.userDefaultsManager = userDefaultsManager
    }
}

extension RandomImageWorker: RandomImageWorkerProtocole {
    
    /// Здесь мы берем ссылку на API и разворачиваем из нее юрл картинки.
    /// choosenFilters - получает массив фильтров, которые мы сохранили в сцене Settings
    /// randomURL - получаем случайное значение из choosenFilters
    /// apiURL - конвертируем randomURL в полноценное юрл, которое дальше парсится и достается url картинки.
    
    func getUrlFromApi(completion: @escaping (String) -> Void) {
        guard let choosenFilters = userDefaultsManager.getFilters(forKey: .selectedFilters) else { return }
        guard let randomURL = choosenFilters.randomElement() else { return }
        guard let apiURL = URL(string: randomURL) else {return}
        
        DispatchQueue.global().sync {
            networkManager.fetch(JsonForPictures.self, from: apiURL) { url in
                print(url)
                switch url {
                case .success(let url):
                    completion(url.url)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    /// Здесь мы загружаем картинку
    /// Кингфишер загружает картинку и применяет к ней изменения
    /// Устанавливает активити индикатор
    /// В комплишене загруженная картинку возвращается как параметр комплишена обратно презентеру
    /// Передается так же юрл самой картинки для дальнейшей работы с ней, если понадобится
    
    func getImageFromKF(
        imageToVC: UIImageView,
        completion: @escaping (UIImageView, String) -> Void
    ) {
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
    
    /// Метод нужен нам для того, чтобы визуально разбить большой метод
    /// Выводит информацию о процессе скачивания изображения
    
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
    
    /// Метод сохраняет юрл картинки в хранилище coreData для дальнейшего взаимодействия
    /// Метод так же сохраняет картинку в кеш KingFisher
    
    func saveToStorage(with url: String, likedImage: UIImageView) {
        guard let imageToSave = likedImage.image else { return }
        KingfisherManager.shared.cache.store(imageToSave, forKey: url)
        storageManager.createImage(url: url)
    }
}
