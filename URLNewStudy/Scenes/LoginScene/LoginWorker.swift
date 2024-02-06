//
//  LoginWorker.swift
//  URLNewStudy
//
//  Created by Акира on 10.01.2024.
//

import Foundation

protocol LoginWorkerProtocole {
    func updateModel(login: String, password: String)
    func login(login: String, password: String) -> Bool
}

// сохраняет последний вход

final class LoginWorker {
    private var validLogin = "admin"
    private var validPassword = "admin"
}

extension LoginWorker: LoginWorkerProtocole {
    func updateModel(login: String, password: String) {
        validPassword = password
        validLogin = password
    }
    
    func login(login: String, password: String) -> Bool {
        login == validLogin && password == validPassword
    }
    
}
