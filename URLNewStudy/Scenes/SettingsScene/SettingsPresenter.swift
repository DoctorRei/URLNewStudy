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
    func saveFilters(with links: [String])
    func savePosition(key: Int, position: Bool)
    func loadPosition(key: Int) -> Bool
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
    
    func saveFilters(with links: [String]) {
        userDefaultsManager.setObject(links, forKey: .selectedFilters)
    }
    
    func savePosition(key: Int, position: Bool) {
        userDefaultsManager.setObjectTestForSwitch(position, forKey: "IndexPath\(key)")
    }
    
    func loadPosition(key: Int) -> Bool {
        guard let switchPosition = userDefaultsManager.getBoolTestForSwitch(forKey: "IndexPath\(key)") else { return false }
        return switchPosition
    }
}
