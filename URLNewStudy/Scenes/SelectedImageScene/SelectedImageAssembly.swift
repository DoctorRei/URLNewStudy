//
//  SelectedImageAssembly.swift
//  URLNewStudy
//
//  Created by Акира on 06.02.2024.
//

import UIKit

final class SelectedImageAssembly {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension SelectedImageAssembly: BaseAssemblyProtocole {
    func configure(viewController: UIViewController) {
        
    }
}
