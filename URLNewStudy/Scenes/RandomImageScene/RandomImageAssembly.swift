//
//  RandomImageAssembly.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//

import UIKit

class RandomImageAssembly {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

 extension RandomImageAssembly: BaseAssemblyProtocole {
    func configure(viewController: UIViewController) {
        guard let randomImgVC = viewController as? RandomImageVC else { return }
        let router = RandomImageRouter(navigationController: navigationController)
        let networkManager = NetworkManager()
        let storageManager = StorageManager.shared
        let worker = RandomImageWorker(networkManager: networkManager, storageManager: storageManager)
        let presenter = RandomImagePresenter(router: router, worker: worker, storageManager: storageManager, view: randomImgVC)
        
        randomImgVC.presenter = presenter
        presenter.view = randomImgVC
    }
}
