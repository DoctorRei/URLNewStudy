//
//  TabBarAssembly.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import UIKit

protocol TabBarAssemblyProtocole {
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

extension TabBarAssembly: BaseAssemblyProtocole {
    func configure(viewController: UIViewController) {
        guard let tabBarVC = viewController as? TabBarView else { return}
        let presenter = TabBarPresenter(view: tabBarVC)
        tabBarVC.presenter = presenter
        presenter.view = tabBarVC
        
        navigationController.navigationBar.isHidden = true
        
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
        favoritesVC.render()
        
        tabBarVC.presenter?.buildTabBar(
            with: randomImgVC,
            seccondItemVC: settingsVC,
            thirdItemVC: favoritesVC)
    }
}

extension TabBarAssembly: TabBarAssemblyProtocole {
    func createRandomImageViewController() -> UIViewController {
        let randomImgVC = RandomImageVC()
        let router = RandomImageRouter(navigationController: navigationController)
        let networkManager = NetworkManager()
        let storageManager = StorageManager.shared
        let worker = RandomImageWorker(networkManager: networkManager, storageManager: storageManager)
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
        let storageManager = StorageManager.shared
        let worker = FavoritesWorker(storageManager: storageManager)
        let presenter = FavoritesPresenter(view: favoritesVC, router: router, storageManager: storageManager, worker: worker)
        
        presenter.view = favoritesVC
        favoritesVC.presenter = presenter
        
        return favoritesVC
    }
}
