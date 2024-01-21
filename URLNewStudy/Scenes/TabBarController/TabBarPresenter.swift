//
//  TabBarPresenter.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import Foundation
import UIKit

protocol ITabBarPresenter: AnyObject  {
    init(view: ITabBarView)
    func buildTabBar(with firstItemVC: UIViewController, seccondItemVC: UIViewController, thirdItemVC: UIViewController)
}

final class TabBarPresenter {
   
    weak var view: ITabBarView?
    
    init(view: ITabBarView) {
        self.view = view
    }
}

extension TabBarPresenter: ITabBarPresenter {
    func buildTabBar(with firstItemVC: UIViewController, seccondItemVC: UIViewController, thirdItemVC: UIViewController) {

        self.view?.setupControllers(controllers: [firstItemVC, seccondItemVC, thirdItemVC] )
    }
    
    
}
