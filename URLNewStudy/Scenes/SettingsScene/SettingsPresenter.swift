//
//  GlobalSettingsPresenter.swift
//  URLNewStudy
//
//  Created by Акира on 14.02.2024.
//

import UIKit

protocol SettingsPresenterProtocole {
    func render()
}

final class SettingsPresenter {
    weak var view: SettingsViewControllerProtocole?
    let router: SettingsRouterProtocole
    
    init(router: SettingsRouterProtocole) {
        self.router = router
    }
}

extension SettingsPresenter: SettingsPresenterProtocole {
    func render() {
        
    }
    
}
