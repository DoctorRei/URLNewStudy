//
//  TabBarPresenter.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import UIKit

protocol ITabBarPresenter: AnyObject  {
    init(view: ITabBarView)
    
    func buildTabBar(
        with firstItemVC: UIViewController,
        seccondItemVC: UIViewController,
        thirdItemVC: UIViewController)
    
    var tabs: [UIImage] {get set}
}

final class TabBarPresenter {
    weak var view: ITabBarView?
    var tabs: [UIImage] = []
    
    init(view: ITabBarView) {
        self.view = view
    }
    
}

extension TabBarPresenter: ITabBarPresenter {
    
    
    func buildTabBar(
        with firstItemVC: UIViewController,
        seccondItemVC: UIViewController,
        thirdItemVC: UIViewController) {
        self.view?.setupControllers(controllers: [firstItemVC, seccondItemVC, thirdItemVC] )
    }
    
    
}
