//
//  SelectedImagePresenter.swift
//  URLNewStudy
//
//  Created by Акира on 06.02.2024.
//

import UIKit

protocol SelectedImagePresenterProtocole {
    func render()
    func setupPhoto() -> String
    func setupLabel() -> String
}

final class SelectedImagePresenter {
    
    weak var view: SelectedImageViewControllerProtocole?
    private var router: SelectedImageRouterProtocole
    private let selectedImages: [String]
    private let selectedIndex: Int
    
    init(view: SelectedImageViewControllerProtocole? = nil,
         router: SelectedImageRouterProtocole,
         selectedImages: [String],
         selectedIndex: Int) {
        self.view = view
        self.router = router
        self.selectedImages = selectedImages
        self.selectedIndex = selectedIndex
    }
    
}

extension SelectedImagePresenter {
    func setupPhoto() -> String {
        let image = selectedImages[selectedIndex]
        print(image)
        return image
        
    }
    
    func setupLabel() -> String {
        let text = String(
            format: "%ld / %ld",
            selectedIndex + 1,
            selectedImages.count)
        print(text)
        return text
        
    }
}

extension SelectedImagePresenter: SelectedImagePresenterProtocole {
    func render() {
    }
}
