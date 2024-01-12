//
//  RegisterPresnter.swift
//  URLNewStudy
//
//  Created by Акира on 07.01.2024.
//

import Foundation

struct RegisterViewModel {
    var login: String
    var password: Data
}

protocol IRegisterPresenter {
    func render()
    func runRandomImageVCFlow()
    func saveNewUser(login: String, password: Data)
}

final class RegisterPresenter {
    
    let router: IRegisterRouter
    private weak var view: IRegisterViewController!
    private let keychainManager: IKeychainManager!
    
    private let name: String
    private let password: Data
    private var status: String
    
    init(router: IRegisterRouter, view: IRegisterViewController!, keychainManager: IKeychainManager, name: String, password: Data, status: String) {
        self.router = router
        self.view = view
        self.keychainManager = keychainManager
        self.name = name
        self.password = password
        self.status = status
    }
}

extension RegisterPresenter: IRegisterPresenter {
    func saveNewUser(login: String, password: Data) {
        let viewModel = RegisterViewModel(login: login, password: password)
        
        do {
            status = try keychainManager.save(
                password: viewModel.password,
                account: viewModel.login
            )
        } catch {
            print(error)
        }
        print(status)
    }
    
    func render() {
        let viewModel = RegisterViewModel(login: name, password: password)
        view.render(viewModel: viewModel)
    }
    
    func runRandomImageVCFlow() {
        router.routeTo(scene: RegisterRouter.Target.randomImgScene)
    }
}
