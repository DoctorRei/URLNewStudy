//
//  RegisterViewController.swift
//  URLNewStudy
//
//  Created by Акира on 07.01.2024.
//

import UIKit

protocol IRegisterViewController: AnyObject {
    func render(viewModel: RegisterViewModel)
}

class RegisterViewController: UIViewController {
    private let loginLabel = UILabel()
    
    var presenter: IRegisterPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        presenter?.render()
    }
    
}

//MARK: - Setup View

private extension RegisterViewController {
    func setupView() {
        view.backgroundColor = .cyan
        addSubViews()
        setupRegisterLabel()
    }
}

//MARK: - Setting

private extension RegisterViewController {
    func addSubViews() {
        view.addSubview(loginLabel)
    }
    
    func setupRegisterLabel() {
        loginLabel.text = "Register"
        loginLabel.textColor = .black
    }
}

private extension RegisterViewController {
    private func setupLayout() {
        
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension RegisterViewController: IRegisterViewController {
    func render(viewModel: RegisterViewModel) {
        loginLabel.text = viewModel.name
    }
}
