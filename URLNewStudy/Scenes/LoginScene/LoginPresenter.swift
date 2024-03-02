//
//  LoginPresenter.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//

import Foundation

//MARK: Protocol

protocol LoginPresenterProtocole {
    func runRegisterFlow()
    func getLogin(login: String)
    func getPassword(password: String)
    func logIn(viewModel: ViewModelLogin)
    func validatePassword(login: String, password: String)
}

//MARK: - View Model

struct ViewModelLogin {
    let login: String
    let password: String
}

//MARK: - LoginPresenter

final class LoginPresenter {
    weak var view: LoginViewControllerProtocole?
    private let keychainManager: KeychainManagerProtocole?
    private let worker: LoginWorkerProtocole
    private let router: LoginRouterProtocole
    private var name = ""
    private var password = Data()
    
    init(
        router: LoginRouterProtocole,
        worker: LoginWorkerProtocole,
        keychainManager: KeychainManagerProtocole?
    ) {
        self.router = router
        self.worker = worker
        self.keychainManager = keychainManager
    }
    
    private func convertPassword(value: String) -> Data {
        return value.data(using: .utf8) ?? Data()
    }
}

//MARK: Protocol extensions

//TODO: - Навести порядок в этом дерьме и разложить все по полочкам.

extension LoginPresenter: LoginPresenterProtocole {
    func validatePassword(
        login: String,
        password: String
    ) {
        let viewModel = ViewModelLogin(login: login, password: password)
        do {
            let data = try keychainManager?.checkPassword(for: login)
            name = String(decoding: data ?? Data(), as: UTF8.self)
            
            if name == password {
                worker.updateModel(login: login, password: password)
                logIn(viewModel: viewModel)
                print("keyChain check ok")
            } else {
                print("Wrong password or login")
            }
        } catch {
            print(error)
        }
    }
    
    func logIn(viewModel: ViewModelLogin) {
        let result = worker.login(
            login: viewModel.login,
            password: viewModel.password
        )
        
        if result {
            router.routeTo(scene: LoginRouter.Target.tabBarController)
        } else {
            router.showError(message: "Wrong login or password")
        }
    }
    
    func getPassword(password: String) {
        self.password = convertPassword(value: password)
    }
    
    func getLogin(login: String) {
        self.name = login
    }
    
    func runRegisterFlow() {
        router.routeTo(
            scene: LoginRouter.Target.registerScene(name: name, password: password)
        )
    }
}
