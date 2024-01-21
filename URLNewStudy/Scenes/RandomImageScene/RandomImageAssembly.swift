//
//  RandomImageAssembly.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//

import Foundation
import UIKit

class RandomImageAssembly {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

 extension RandomImageAssembly: IBaseAssembly {
    func configure(viewController: UIViewController) {
        guard let randomImgVC = viewController as? RandomImageVC else { return }
        let router = RandomImageRouter(navigationController: navigationController)
        let networkManager = NetworkManager()
        let worker = RandomImageWorker(networkManager: networkManager)
        let presenter = RandomImagePresenter(view: randomImgVC, router: router, worker: worker)
        
        randomImgVC.presenter = presenter
        presenter.view = randomImgVC
    }
}
