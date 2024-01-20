//
//  SettingsRouter.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import Foundation
import UIKit

protocol ISettingsRouter: IBaseRouting  {
    
}

final class SettingsRouter {
    
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

extension SettingsRouter: ISettingsRouter {
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
