//
//  SelectedImagePresenter.swift
//  URLNewStudy
//
//  Created by Акира on 06.02.2024.
//

import UIKit

protocol SelectedImagePresenterProtocole {
    func render()
    func getImageUrl() -> String
    func setupLabel() -> String
    func changeIndex(with: WorkWithIndexes)
}

enum WorkWithIndexes {
    case minus
    case plus
}

final class SelectedImagePresenter {
    
    weak var view: SelectedImageViewControllerProtocole?
    private var router: SelectedImageRouterProtocole
    private let selectedImages: [String]
    private var selectedIndex: Int
    
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
    func getImageUrl() -> String {
        let image = selectedImages[selectedIndex]
        return image
    }
    
    func changeIndex(with: WorkWithIndexes) {
        switch with {
        case .minus:
            selectedIndex = max(selectedIndex - 1, 0)
        case .plus:
            selectedIndex = min(selectedIndex + 1, selectedImages.count - 1)
        }
    }
    
    func setupLabel() -> String {
        let text = String(
            format: "%ld / %ld",
            selectedIndex + 1,
            selectedImages.count)
        return text
    }
}

extension SelectedImagePresenter: SelectedImagePresenterProtocole {
    func render() {
    }
}
