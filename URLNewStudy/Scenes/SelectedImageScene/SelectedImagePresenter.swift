//
//  SelectedImagePresenter.swift
//  URLNewStudy
//
//  Created by Акира on 06.02.2024.
//

import Foundation

protocol SelectedImagePresenterProtocole {
    func render()
}

class SelectedImagePresenter {
    
    weak var view: SelectedImageViewControllerProtocole?
    private var router: SelectedImageRouterProtocole
    
    init(view: SelectedImageViewControllerProtocole? = nil, router: SelectedImageRouterProtocole) {
        self.view = view
        self.router = router
    }
    
}

extension SelectedImagePresenter: SelectedImagePresenterProtocole {
    func render() {
        
    }
}
