//
//  LoginPresenter.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//

import Foundation

protocol ILoginPresenter {
    func runRegisterFlow()
    func getName(name: String)
}

final class LoginPresenter {
    weak var view: ILoginViewController?
    let router: ILoginRouter
    private var name = "misha"
    
    init(router: ILoginRouter) {
        self.router = router
    }
}

extension LoginPresenter: ILoginPresenter {
    func getName(name: String) {
        self.name = name
    }
    
    func runRegisterFlow() {
        router.routeTo(scene: LoginRouter.Target.registerScene(name: name))
    }
}
