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
}

final class LoginPresenter {
    weak var view: ILoginViewController?
    let router: ILoginRouter
    private var name = ""
    
    init(router: ILoginRouter) {
        self.router = router
    }
}

extension LoginPresenter: ILoginPresenter {
    func getLogin(Login: String) {
        self.name = Login
    }
    
    func runRegisterFlow() {
        router.routeTo(scene: LoginRouter.Target.registerScene(name: name))
    }
}
