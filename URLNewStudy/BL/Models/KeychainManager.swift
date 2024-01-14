//
//  KeychainManager.swift
//  URLNewStudy
//
//  Created by Акира on 12.01.2024.
//

import Foundation

protocol IKeychainManager {
    func save(password: Data, account: String) throws -> String
    //     func checkPassword(for account: String) throws -> Data?
    func getPassword(for account: String) -> String?
}

enum KeychainError: Error {
    case duplicateItem
    case unknown(status: OSStatus)
}

final class KeychainManager: IKeychainManager {
    
    func save(password: Data, account: String) throws -> String {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecValueData: password
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil) // принимает два параметра и возвращает код статуса. В первом параметре мы передаем словарь, а во втором должна быть ссылка на передаваемый элемент.
        
        guard status != errSecDuplicateItem else {
            throw KeychainError.duplicateItem
        }
        
        guard status == errSecSuccess else {
            throw KeychainError.unknown(status: status)
        }
        
        return "Saved"
    }
    
    func getPassword(for account: String) -> String? {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecMatchLimit: kSecMatchLimitOne,
            kSecReturnAttributes: kCFBooleanTrue as Any,
            kSecReturnData: kCFBooleanTrue as Any
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        guard status == errSecSuccess else {
            if status == errSecItemNotFound {
                print("Password not found for account: \(account)")
            } else {
                print("Error retrieving password for account: \(account), status: \(status)")
            }
            return nil
        }
        
        guard let existingItem = item as? [CFString: Any],
              let passwordData = existingItem[kSecValueData] as? Data,
              let password = String(data: passwordData, encoding: .utf8)
        else {
            print("Invalid password data for account: \(account)")
            return nil
        }
        
        return password
    }
    
    
    //     func checkPassword(for account: String) throws -> Data? {
    //        let query: [CFString: Any] = [
    //            kSecClass: kSecClassGenericPassword,
    //            kSecAttrAccount: account,
    //            kSecReturnData: kCFBooleanTrue as Any
    //        ]
    //
    //        var result: AnyObject?
    //
    //        // получаем данные из кейчеин
    //        let status = SecItemCopyMatching(query as CFDictionary, &result)
    //
    //        guard status == errSecSuccess else {
    //            throw KeychainError.unknown(status: status)
    //        }
    //
    //        print("Test")
    //         return result as? Data
    //    }
}
