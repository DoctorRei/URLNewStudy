//
//  KeychainManager.swift
//  URLNewStudy
//
//  Created by Акира on 12.01.2024.
//

import Foundation

enum  KeychainError: Error {
    case duplicateItem
    case unknown(status: OSStatus)
}

final class KeychainManager {
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
}
