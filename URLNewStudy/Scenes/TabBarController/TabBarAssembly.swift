//
//  TabBarAssembly.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import Foundation
import UIKit

final class TabBarAssembly {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension TabBarAssembly: IBaseAssembly {
    func configure(viewController: UIViewController) {
        guard let tabBarVC = viewController as? TabBarView else { return}
        let presenter = TabBarPresenter(view: tabBarVC)
        
        tabBarVC.presenter = presenter
        presenter.view = tabBarVC
        
        guard let randomImgVC = createRandomImageViewController() as? RandomImageVC else { return}
        randomImgVC.title = "First"
        guard let settingsVC = createSettingsViewController() as? SettingsViewController else {return}
        settingsVC.title = "Second"
        guard let favoritesVC = createFavoritesViewController() as? FavoritesViewController else {return}
        settingsVC.title = "Third"
        
        tabBarVC.presenter?.buildTabBar(
            with: randomImgVC,
            seccondItemVC: settingsVC,
            thirdItemVC: favoritesVC)
    }
}

extension TabBarAssembly: IBaseTabBar {
    func createRandomImageViewController() -> UIViewController {
        let randomImgVC = RandomImageVC()
        let router = RandomImageRouter(navigationController: navigationController)
        let networkManager = NetworkManager()
        let worker = RandomImageWorker(networkManager: networkManager)
        let presenter = RandomImagePresenter(
            view: randomImgVC,
            router: router,
            worker: worker)
        
        presenter.view = randomImgVC
        randomImgVC.presenter = presenter
        
        return randomImgVC
    }
    
    func createSettingsViewController() -> UIViewController {
        let settingsVC = SettingsViewController()
        let router = SettingsRouter(navigationController: navigationController)
        let presenter = SettingsPresenter(router: router)
        
        presenter.view = settingsVC
        settingsVC.presenter = presenter
        
        return settingsVC
    }
    
    func createFavoritesViewController() -> UIViewController {
        let favoritesVC = FavoritesViewController()
        let router = FavoritesRouter(navigationController: navigationController)
        let presenter = FavoritesPresenter(router: router)
        
        presenter.view = favoritesVC
        favoritesVC.presenter = presenter
        
        return favoritesVC
    }
}
