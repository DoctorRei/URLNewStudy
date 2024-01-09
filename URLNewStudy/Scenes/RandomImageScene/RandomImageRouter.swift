//
//  RandomImageRouter.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//

import UIKit

protocol IRandomImageRouter: IBaseRouting  {
    
}

final class RandomImageRouter {
    
    enum Target {
        case loginScene
        case mainScene
    }
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension RegisterRouter: IRandomImageRouter {
//    func routeTo(scene: Any) {
//        guard let registerTarget = scene as? RegisterRouter.Target else {return}
//
//    }
}
