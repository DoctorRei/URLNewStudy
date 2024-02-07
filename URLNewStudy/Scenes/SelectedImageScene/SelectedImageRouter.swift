//
//  SelectedImageRouter.swift
//  URLNewStudy
//
//  Created by Акира on 06.02.2024.
//

import UIKit

protocol SelectedImageRouterProtocole: BaseRoutingProtocole {
    
}

final class SelectedImageRouter {
    
    let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}

extension SelectedImageRouter: SelectedImageRouterProtocole {
    func routeTo(scene: Any) {
        
    }
    
}
