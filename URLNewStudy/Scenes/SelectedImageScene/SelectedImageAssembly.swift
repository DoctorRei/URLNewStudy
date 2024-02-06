//
//  SelectedImageAssembly.swift
//  URLNewStudy
//
//  Created by Акира on 06.02.2024.
//

import UIKit

final class SelectedImageAssembly {
    
    private var navigationController: UINavigationController
    private let selectedImage: UIImage
    
    init(navigationController: UINavigationController, selectedImage: UIImage) {
        self.navigationController = navigationController
        self.selectedImage = selectedImage
    }
}

extension SelectedImageAssembly: BaseAssemblyProtocole {
    func configure(viewController: UIViewController) {
        guard let selectedImageVC = viewController as? SelectedImageViewController else { return }
        let router = SelectedImageRouter(navigationController: navigationController)
        let presenter = SelectedImagePresenter(
            view: selectedImageVC,
            router: router,
            selectedImage: selectedImage
        )
        
        selectedImageVC.presenter = presenter
        presenter.view = selectedImageVC
    }
}
