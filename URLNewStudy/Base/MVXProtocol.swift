//
//  MVXProtocol.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//

import UIKit

protocol IBaseAssembly {
    func configure(viewController: UIViewController)
}

protocol IBaseRouting {
    func routeTo(scene: Any)
    init(navigationController: UINavigationController)
}

protocol IBaseTabBar {
    func createTabBar() -> UIViewController
    
    func createRandomImageViewController() -> UIViewController
    func createSettingsViewController() -> UIViewController
    func createFavoritesViewController() -> UIViewController
}
