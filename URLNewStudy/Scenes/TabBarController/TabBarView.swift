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

class TabBarView: UITabBarController {

    var presenter: ITabBarPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
    }
    

}

extension TabBarView: ITabBarView {
    func setupControllers(controllers: [UIViewController]) {
        tabBarController?.setViewControllers(controllers, animated: true)
    }
    
}
