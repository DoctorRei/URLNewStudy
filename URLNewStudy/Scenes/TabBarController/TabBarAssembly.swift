//
//  TabBarAssembly.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import UIKit

protocol ITabBarAssembly {
    func createRandomImageViewController() -> UIViewController
    func createSettingsViewController() -> UIViewController
    func createFavoritesViewController() -> UIViewController
}

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
        
        //TODO: - Настройку реализовать потом адекватно
        
        guard let randomImgVC = createRandomImageViewController() as? RandomImageVC else { return}
        randomImgVC.title = "First"
        randomImgVC.tabBarItem.image = UIImage(systemName: "sparkles")
        randomImgVC.tabBarItem.selectedImage?.withTintColor(.yellow)
        randomImgVC.tabBarItem.selectedImage?.withTintColor(.yellow, renderingMode: .automatic)
        
        
        guard let settingsVC = createSettingsViewController() as? SettingsViewController else {return}
        settingsVC.title = "Second"
        settingsVC.tabBarItem.image = UIImage(systemName: "gearshape")
        settingsVC.tabBarItem.selectedImage = UIImage(systemName: "gearshape.fill")
        
        guard let favoritesVC = createFavoritesViewController() as? FavoritesViewController else {return}
        favoritesVC.tabBarItem.image = UIImage(systemName: "heart")
        favoritesVC.tabBarItem.selectedImage = UIImage(systemName: "heart.fill")
        favoritesVC.title = "Third"
        
        tabBarVC.presenter?.buildTabBar(
            with: randomImgVC,
            seccondItemVC: settingsVC,
            thirdItemVC: favoritesVC)
    }
}

extension TabBarAssembly: ITabBarAssembly {
    func createRandomImageViewController() -> UIViewController {
        let randomImgVC = RandomImageVC()
        let router = RandomImageRouter(navigationController: navigationController)
        let networkManager = NetworkManager()
        let worker = RandomImageWorker(networkManager: networkManager)
        let storageManager = StorageManager.shared
        let presenter = RandomImagePresenter(
            router: router,
            worker: worker,
            storageManager: storageManager,
            view: randomImgVC)
        
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
