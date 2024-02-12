//
//  SettingsPresenter.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import UIKit

protocol SettingsPresenterProtocole {
    func render()
    func getLinks() -> [Links]
    func saveFilter(with link: String)
    func saveSwitchPosition(with position: Bool)
    func deleteSwitchPosition()
}

final class SettingsPresenter {
    weak var view: SettingsViewControllerProtocole?
    private let router: SettingsRouterProtocole
    private let userDefaultsManager: UserDefaultsManagerProtocole
    private let links = Links.allCases
    
    init(
        router: SettingsRouterProtocole,
        userDefaultsManager: UserDefaultsManagerProtocole
    ) {
        self.router = router
        self.userDefaultsManager = userDefaultsManager
    }
}

extension SettingsPresenter: SettingsPresenterProtocole {
    
    func render() {
        
    }
    
    func getLinks() -> [Links] {
        links
    }
    
    func saveFilter(with link: String) {
        userDefaultsManager.setObject(link, forKey: .string)
        print(link)
    }
    
    func saveSwitchPosition(with position: Bool) {
        userDefaultsManager.setObject(position, forKey: .bool)
    }
    
    func deleteSwitchPosition() {
        userDefaultsManager.deleteObject(forKey: .bool)
    }
    
}
