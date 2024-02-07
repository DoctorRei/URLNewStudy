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

final class SelectedImagePresenter {
    
    weak var view: SelectedImageViewControllerProtocole?
    private var router: SelectedImageRouterProtocole
    private let selectedImages: [UIImage]
    private let selectedIndex: Int
    
    init(view: SelectedImageViewControllerProtocole? = nil, router: SelectedImageRouterProtocole, selectedImages: [UIImage], selectedIndex: Int) {
        self.view = view
        self.router = router
        self.selectedImages = selectedImages
        self.selectedIndex = selectedIndex
    }
    
}

extension SelectedImagePresenter: SelectedImagePresenterProtocole {
    func render() {
        
    }
}
