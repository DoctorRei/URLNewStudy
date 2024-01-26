//
//  SettingsPresenter.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import UIKit

protocol ISettingsPresenter {
    func render()
}

final class SettingsPresenter {
    weak var view: ISettingsViewController?
    private let router: ISettingsRouter
    
    init(router: ISettingsRouter) {
        self.router = router
    }
}

extension SettingsPresenter: ISettingsPresenter {
    func render() {
        
    }
}
