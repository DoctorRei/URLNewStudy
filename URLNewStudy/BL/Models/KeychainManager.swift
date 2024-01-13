//
//  KeychainManager.swift
//  URLNewStudy
//
//  Created by Акира on 12.01.2024.
//

import Foundation

protocol IKeychainManager {
    func save(password: Data, account: String) throws -> String
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
    
    func checkPassword(for account: String) throws -> Data? {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecReturnData: kCFBooleanTrue as Any
        ]
        
        var result: AnyObject?
        
        // получаем данные из кейчеин
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        guard status == errSecSuccess else {
            throw KeychainError.unknown(status: status)
        }
        
        return result as? Data
    }
}
