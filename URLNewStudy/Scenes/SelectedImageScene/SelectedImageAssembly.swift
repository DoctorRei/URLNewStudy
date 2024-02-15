//
//  SelectedImageAssembly.swift
//  URLNewStudy
//
//  Created by Акира on 06.02.2024.
//

import UIKit

/// Мы получаем два свойства.
/// SelectedImages дает нам массив ссылок на сами картинки,
/// дальше мы будем с их помощью устанавливать новое значение для UIImageView
///
/// SelectedIndex - Индекс выбранной картинки. По ней мы будем доставть нужный элемент из массива
/// Юрлов и присваивать  его к UIImageView.

final class SelectedImageAssembly {
    
    private var navigationController: UINavigationController
    private let selectedImages: [String]
    private let selectedIndex: Int
    
    init(navigationController: UINavigationController, selectedImages: [String], selectedIndex: Int) {
        self.navigationController = navigationController
        self.selectedImages = selectedImages
        self.selectedIndex = selectedIndex
    }
}

extension SelectedImageAssembly: BaseAssemblyProtocole {
    func configure(viewController: UIViewController) {
        guard let selectedImageVC = viewController as? SelectedImageViewController else { return }
        navigationController.navigationBar.isHidden = false
        
        let router = SelectedImageRouter(navigationController: navigationController)
        let presenter = SelectedImagePresenter(
            view: selectedImageVC,
            router: router,
            selectedImages: selectedImages,
            selectedIndex: selectedIndex
        )
        
        selectedImageVC.presenter = presenter
        presenter.view = selectedImageVC
    }
    
}
