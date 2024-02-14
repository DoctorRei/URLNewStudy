//
//  SettingsPresenter.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import UIKit

protocol FiltersPresenterProtocole {
    func render()
    func getLinks() -> [Links]
    func saveFilters(with links: [String])
    func savePosition(key: Int, position: Bool)
    func loadPosition(key: Int) -> Bool
    func loadFilters() -> [String]
}

final class FiltersPresenter {
    weak var view: FiltersViewControllerProtocole?
    private let router: FiltersRouterProtocole
    private let userDefaultsManager: UserDefaultsManagerProtocole
    private let links = Links.allCases
    private var selectedFilters: [String] = []
    
    init(
        router: FiltersRouterProtocole,
        userDefaultsManager: UserDefaultsManagerProtocole
    ) {
        self.router = router
        self.userDefaultsManager = userDefaultsManager
    }
}

extension FiltersPresenter: FiltersPresenterProtocole {
    func render() {
    }
    
    /// Получаем список ссылок на API
    
    func getLinks() -> [Links] {
        links
    }
    
    /// Сохраняем выбранные пользователем фиьтры
    
    func saveFilters(with links: [String]) {
        userDefaultsManager.setObject(links, forKey: .selectedFilters)
    }
    
    /// Получаем список фильтров, которые раннее выбрал пользователь
    
    func loadFilters() -> [String] {
        guard let selectedFilters = userDefaultsManager.getFilters(forKey: .selectedFilters) else { return []}
        return selectedFilters
    }
    
    /// Сохраняем позицию ползунка UISwitch, которую выбрал пользователь
    
    func savePosition(key: Int, position: Bool) {
        userDefaultsManager.setObjectTestForSwitch(position, forKey: "IndexPath\(key)")
    }
    
    /// Загружаем позиции ползунка UISwitch для того, чтобы при входе в приложение
    /// они отобразились включенными у пользователя
    
    func loadPosition(key: Int) -> Bool {
        guard let switchPosition = userDefaultsManager.getBoolTestForSwitch(forKey: "IndexPath\(key)") else { return false }
        return switchPosition
    }
}
