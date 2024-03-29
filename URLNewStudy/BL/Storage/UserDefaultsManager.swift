//
//  UserDefaultsManager.swift
//  URLNewStudy
//
//  Created by Акира on 11.02.2024.
//

/// В приложении уже реализована КорДата, но по большей части ЮзерДефолтс реализован для моей же практики

import Foundation

protocol UserDefaultsManagerProtocole {
    func setObject(_ object: Any?, forKey key: UserDefaultsManager.Keys)
    func setTObject<T: Encodable>(_ object: T?, forKey key: UserDefaultsManager.Keys)
    func deleteObject(forKey key: UserDefaultsManager.Keys)
    func getCodableData<T:Decodable>(forKey key: UserDefaultsManager.Keys) -> T?
    func getData(forKey key: UserDefaultsManager.Keys) -> Data?
    func getBool(forKey key: UserDefaultsManager.Keys) -> Bool?
    func getString(forKey key: UserDefaultsManager.Keys) -> String?
    func getFilters(forKey key: UserDefaultsManager.Keys) -> [String]?
    
    func setObjectTestForSwitch(_ object: Any?, forKey key: String)
    func getBoolTestForSwitch(forKey key: String) -> Bool?
    
}

final class UserDefaultsManager {
    
    public enum Keys: String {
        case data
        case bool
        case string
        case selectedFilters
    }
    
    private let userDefaults = UserDefaults.standard
    
    private func save(_ object: Any?, key: String) {
        userDefaults.set(object, forKey: key)
    }
    
    private func restore(forKey key: String) -> Any? {
        userDefaults.object(forKey: key)
    }
}

extension UserDefaultsManager: UserDefaultsManagerProtocole {
    func setObject(_ object: Any?, forKey key: UserDefaultsManager.Keys) {
        save(object, key: key.rawValue)
    }
    
    func setTObject<T: Encodable>(_ object: T?, forKey key: UserDefaultsManager.Keys) {
        let jsonData = try? JSONEncoder().encode(object)
        save(jsonData, key: key.rawValue)
    }
    
    func getBool(forKey key: UserDefaultsManager.Keys) -> Bool? {
        restore(forKey: key.rawValue) as? Bool
    }
    
    func getData(forKey key: UserDefaultsManager.Keys) -> Data? {
        restore(forKey: key.rawValue) as? Data
    }
    
    func getString(forKey key: UserDefaultsManager.Keys) -> String? {
        restore(forKey: key.rawValue) as? String
    }
    
    func getCodableData<T:Decodable>(forKey key: UserDefaultsManager.Keys) -> T? {
        guard let data = restore(forKey: key.rawValue) as? Data else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
    func getFilters(forKey key: UserDefaultsManager.Keys) -> [String]? {
        restore(forKey: key.rawValue) as? [String]
    }
    
    func deleteObject(forKey key: UserDefaultsManager.Keys) {
        userDefaults.removeObject(forKey: key.rawValue)
    }
    
    func setObjectTestForSwitch(_ object: Any?, forKey key: String) {
        save(object, key: key)
    }
    
    func getBoolTestForSwitch(forKey key: String) -> Bool? {
        restore(forKey: key) as? Bool
    }
}
