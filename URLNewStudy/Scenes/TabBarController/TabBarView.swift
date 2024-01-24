//
//  TabBarController.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import UIKit

protocol ITabBarView: AnyObject {
    func setupControllers(controllers: [UIViewController])
}

final class TabBarView: UITabBarController {

    var presenter: ITabBarPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
    }
}

extension TabBarView {
    func createTabBarButton() -> UIButton {
        return UIButton()
    }
}

extension TabBarView: ITabBarView {
    func setupControllers(controllers: [UIViewController]) {
        setViewControllers(controllers, animated: true)
    }
    
}
