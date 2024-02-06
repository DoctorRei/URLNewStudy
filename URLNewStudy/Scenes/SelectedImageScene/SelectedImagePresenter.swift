//
//  SelectedImagePresenter.swift
//  URLNewStudy
//
//  Created by Акира on 06.02.2024.
//

import UIKit

protocol SelectedImagePresenterProtocole {
    func render()
}

class SelectedImagePresenter {
    
    weak var view: SelectedImageViewControllerProtocole?
    private var router: SelectedImageRouterProtocole
    private let selectedImage: UIImage
    
    init(view: SelectedImageViewControllerProtocole?, router: SelectedImageRouterProtocole, selectedImage: UIImage) {
        self.view = view
        self.router = router
        self.selectedImage = selectedImage
    }
    
}

extension SelectedImagePresenter: SelectedImagePresenterProtocole {
    func render() {
        
    }
}
