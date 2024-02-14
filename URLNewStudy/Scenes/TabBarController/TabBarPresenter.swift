//
//  TabBarPresenter.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import UIKit

protocol TabBarPresenterProtocole: AnyObject  {
    init(view: TabBarProtocole)
    
    func buildTabBar(
        with firstItemVC: UIViewController,
        seccondItemVC: UIViewController,
        thirdItemVC: UIViewController)
    
    var tabs: [UIImage] {get set}
}

final class TabBarPresenter {
    weak var view: TabBarProtocole?
    var tabs: [UIImage] = []
    
    init(view: TabBarProtocole) {
        self.view = view
    }
    
}

extension TabBarPresenter: TabBarPresenterProtocole {
    
    func buildTabBar(
        with firstItemVC: UIViewController,
        seccondItemVC: UIViewController,
        thirdItemVC: UIViewController) {
        self.view?.setupControllers(controllers: [firstItemVC, seccondItemVC, thirdItemVC] )
    }
    
}
