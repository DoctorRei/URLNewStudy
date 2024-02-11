//
//  RandomImageAssembly.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//

import UIKit

class RandomImageAssembly {
    
    private let linkFromFilters: String?
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController, linkFromFilters: String? = nil) {
        self.navigationController = navigationController
        self.linkFromFilters = linkFromFilters
    }
}

extension RandomImageAssembly: BaseAssemblyProtocole {
    func configure(viewController: UIViewController) {
        guard let randomImgVC = viewController as? RandomImageVC else { return }
        let router = RandomImageRouter(navigationController: navigationController)
        let networkManager = NetworkManager()
        let storageManager = StorageManager.shared
        let userDefaultsManager = UserDefaultsManager()
        let worker = RandomImageWorker(
            networkManager: networkManager,
            storageManager: storageManager,
            userDefaultsManager: userDefaultsManager)
        let presenter = RandomImagePresenter(
            router: router,
            worker: worker,
            storageManager: storageManager,
            view: randomImgVC,
            userDefaultsManager: userDefaultsManager)
        
        randomImgVC.presenter = presenter
        presenter.view = randomImgVC
    }
}
