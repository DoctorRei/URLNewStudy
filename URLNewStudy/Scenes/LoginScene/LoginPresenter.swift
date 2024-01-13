//
//  LoginPresenter.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//

import Foundation

protocol ILoginPresenter {
    func runRegisterFlow()
    func getLoginAndPassword(login: String, password: Data)
    func logIn(viewModel: ViewModelLogin)
}

struct ViewModelLogin {
    let login: String
    let password: String
}

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
}

extension LoginPresenter: ILoginPresenter {
    func logIn(viewModel: ViewModelLogin) {
        let result = worker.login(login: viewModel.login, password: viewModel.password)
        
        if result {
            router.routeTo(scene: LoginRouter.Target.randomImageScene)
        } else {
            router.showError(message: "Wrong login or password")
        }
    }
    
    func getLoginAndPassword(login: String, password: Data) {
        self.name = login
        self.password = password
    }
    
    func runRegisterFlow() {
        router.routeTo(scene: LoginRouter.Target.registerScene(name: name, password: password))
    }
}
