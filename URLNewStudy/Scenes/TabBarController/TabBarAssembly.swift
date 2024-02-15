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
        
        guard let randomImgVC = createRandomImageViewController() as? RandomImageViewController else { return}
        randomImgVC.title = "Get!"
        randomImgVC.tabBarItem.image = UIImage(systemName: "sparkles")
        
        guard let settingsVC = createSettingsViewController() as? SettingsViewController else {return}
        settingsVC.title = "Settings"
        settingsVC.tabBarItem.image = UIImage(systemName: "gearshape")
        settingsVC.tabBarItem.selectedImage = UIImage(systemName: "gearshape.fill")
        
        guard let favoritesVC = createFavoritesViewController() as? FavoritesViewController else {return}
        favoritesVC.tabBarItem.image = UIImage(systemName: "heart")
        favoritesVC.tabBarItem.selectedImage = UIImage(systemName: "heart.fill")
        favoritesVC.title = "Gallery"
        
        tabBarVC.presenter?.buildTabBar(
            with: randomImgVC,
            seccondItemVC: settingsVC,
            thirdItemVC: favoritesVC)
    }
}

extension TabBarAssembly: TabBarAssemblyProtocole {
    func createRandomImageViewController() -> UIViewController {
        let randomImageVC = RandomImageViewController()
        let assembly = RandomImageAssembly(navigationController: navigationController)
        assembly.configure(viewController: randomImageVC)
        
        return randomImageVC
    }
    
    func createSettingsViewController() -> UIViewController {
        let settingsVC = SettingsViewController()
        let assembly = SettingsAssembly(navigationController: navigationController)
        assembly.configure(viewController: settingsVC)
        
        return settingsVC
    }
    
    func createFavoritesViewController() -> UIViewController {
        let favoritesVC = FavoritesViewController()
        let assembly = FavoritesAssembly(navigationController: navigationController)
        assembly.configure(viewController: favoritesVC)
        
        return favoritesVC
    }
}
