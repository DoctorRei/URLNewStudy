//
//  LoginWorker.swift
//  URLNewStudy
//
//  Created by Акира on 10.01.2024.
//

import Foundation

protocol ILoginWorker {
    func login(login: String, password: String) -> Bool
}

final class LoginWorker {
    private let validLogin = "admin"
    private var validPassword = "admin"
}

extension LoginWorker: ILoginWorker {
    func login(login: String, password: String) -> Bool {
        login == validLogin && password == validPassword
    }
    
}
