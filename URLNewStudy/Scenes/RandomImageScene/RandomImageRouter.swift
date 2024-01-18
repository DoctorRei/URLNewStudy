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

//TODO: - Заглушка навигации

extension RandomImageRouter: IRandomImageRouter {
    func routeTo(scene: Any) {
        guard let randomImageTarget = scene as? RandomImageRouter.Target else {return}
        
        switch randomImageTarget {
        case .loginScene:
            break
        case .mainScene:
            break
        }
    }
}
