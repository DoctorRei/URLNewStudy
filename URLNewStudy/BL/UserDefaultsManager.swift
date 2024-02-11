//
//  UserDefaultsManager.swift
//  URLNewStudy
//
//  Created by Акира on 11.02.2024.
//

import Foundation

protocol UserDefaultsManagerProtocole {
    func setObject(_ object: Any?, forKey key: UserDefaultsManager.Keys)
    func setTObject<T: Encodable>(_ object: T?, forKey key: UserDefaultsManager.Keys)
    func deleteObject(forKey key: UserDefaultsManager.Keys)
    func getCodableData<T:Decodable>(forKey key: UserDefaultsManager.Keys) -> T?
    func getData(forKey key: UserDefaultsManager.Keys) -> Data?
    func getBool(forKey key: UserDefaultsManager.Keys) -> Bool?
    func getString(forKey key: UserDefaultsManager.Keys) -> String?
    
}

final class UserDefaultsManager {
    
    public enum Keys: String {
        case data
        case bool
        case string
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
    
    func deleteObject(forKey key: UserDefaultsManager.Keys) {
        userDefaults.removeObject(forKey: key.rawValue)
    }
    
    
    
        
    
}
