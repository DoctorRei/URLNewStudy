//
//  RegisterPresnter.swift
//  URLNewStudy
//
//  Created by Акира on 07.01.2024.
//

import Foundation

protocol IRegisterPresenter {
    
}

final class RegisterPresenter {
    private weak var view: IRegisterViewController!
    let router: IRegisterRouter
    
    init(view: IRegisterViewController, router: IRegisterRouter) {
        self.view = view
        self.router = router
    }
}

extension RegisterPresenter: IRegisterPresenter {
    
}
