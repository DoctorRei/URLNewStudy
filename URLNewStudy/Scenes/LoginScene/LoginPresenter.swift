//
//  LoginPresenter.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//

import Foundation

//MARK: Protocol

protocol ILoginPresenter {
    func runRegisterFlow()
    func getLogin(login: String)
    func getPassword(password: String)
    func logIn(viewModel: ViewModelLogin)
}

//MARK: - View Model

struct ViewModelLogin {
    let login: String
    let password: String
}

//MARK: - LoginPresenter

final class LoginPresenter {
    weak var view: ILoginViewController?
    private let worker: ILoginWorker
    private let router: ILoginRouter
    private var name = ""
    private var password = Data()
    
    init(router: ILoginRouter, worker: ILoginWorker) {
        self.router = router
        self.worker = worker
    }
    
    private func convertPassword(value: String) -> Data {
        return value.data(using: .utf8) ?? Data()
    }
}

//MARK: Protocol extensions

extension LoginPresenter: ILoginPresenter {
    func logIn(viewModel: ViewModelLogin) {
        let result = worker.login(
            login: viewModel.login,
            password: viewModel.password
        )
        
        if result {
            router.routeTo(scene: LoginRouter.Target.randomImageScene)
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
