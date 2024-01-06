//
//  LoginPresenter.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//

import Foundation

protocol ILoginPresenter {
    
}

final class LoginPresenter {
    weak var view: ILoginViewController?
    let router: ILoginRouter
    
    init(router: ILoginRouter) {
        self.router = router
    }
}

extension LoginPresenter: ILoginPresenter {
    
}
