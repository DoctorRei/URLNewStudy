//
//  LoginPresenter.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//

import Foundation

protocol ILoginPresenter {
    func runRegisterFlow()
    func getLogin(Login: String)
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
            print("SomeWrong")
        }
    }
    
    func getLogin(Login: String) {
        self.name = Login
    }
    
    func runRegisterFlow() {
        router.routeTo(scene: LoginRouter.Target.registerScene(name: name))
    }
}
