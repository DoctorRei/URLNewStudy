//
//  TabBarController.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import UIKit

protocol TabBarProtocole: AnyObject {
    func setupControllers(controllers: [UIViewController])
}

final class TabBarView: UITabBarController {
    
    var presenter: TabBarPresenterProtocole?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
}

extension TabBarView {
    func createTabBarButton() -> UIButton {
        return UIButton()
    }
    
    func setupTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.shadowColor = nil
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = UITabBar.appearance().standardAppearance
    }
}

extension TabBarView: TabBarProtocole {
    func setupControllers(controllers: [UIViewController]) {
        setViewControllers(controllers, animated: true)
    }
}
