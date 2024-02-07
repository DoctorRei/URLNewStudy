//
//  SettingsPresenter.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import UIKit

protocol SettingsPresenterProtocole {
    func render()
}

final class SettingsPresenter {
    weak var view: SettingsViewControllerProtocole?
    private let router: SettingsRouterProtocole
    
    init(router: SettingsRouterProtocole) {
        self.router = router
    }
}

extension SettingsPresenter: SettingsPresenterProtocole {
    func render() {
        
    }
}
