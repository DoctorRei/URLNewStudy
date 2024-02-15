//
//  GlobalSettingsPresenter.swift
//  URLNewStudy
//
//  Created by Акира on 14.02.2024.
//

import UIKit

protocol SettingsPresenterProtocole {
    func render()
    func roadToFiltersScene()
    func roadToLoginScene()
    func clearGallery()
}

final class SettingsPresenter {
    weak var view: SettingsViewControllerProtocole?
    let router: SettingsRouterProtocole
    let worker: SettingsWorkerProtocole
    
    init(router: SettingsRouterProtocole, worker: SettingsWorkerProtocole) {
        self.router = router
        self.worker = worker
    }
}

extension SettingsPresenter: SettingsPresenterProtocole {
    func render() {
        
    }
    
    func roadToFiltersScene() {
        router.routeTo(scene: SettingsRouter.Target.filtersScene)
    }
    
    func roadToLoginScene() {
        router.routeTo(scene: SettingsRouter.Target.backToLoginScene)
    }
    
    func clearGallery() {
        worker.clearImages()
    }
}
