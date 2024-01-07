//
//  RegisterPresnter.swift
//  URLNewStudy
//
//  Created by Акира on 07.01.2024.
//

import Foundation

struct RegisterViewModel {
    let name: String
}

protocol IRegisterPresenter {
    func render()
}

final class RegisterPresenter {
    let router: IRegisterRouter
    
    private weak var view: IRegisterViewController!
    private let name: String
    
    init(view: IRegisterViewController, router: IRegisterRouter, name: String) {
        self.view = view
        self.router = router
        self.name = name
    }
}

extension RegisterPresenter: IRegisterPresenter {
    func render() {
        let viewModel = RegisterViewModel(name: name)
        view.render(viewModel: viewModel)
    }
}
