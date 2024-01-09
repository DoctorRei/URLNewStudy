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

final class RegisterViewController: UIViewController {
    private let loginLabel = UILabel()
    private let loginTF = CustomTextField(placeholder: "Login")
    private let passwordTF = CustomTextField(placeholder: "Password")
    private let verifyPasswordTF = CustomTextField(placeholder: "Verify password")
    private let emailTF = CustomTextField(placeholder: "E-mail")
    private let registerButton = UIButton(configuration: .filled())
    
    var presenter: IRegisterPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        presenter?.render()
    }
}

//MARK: - Actions

private extension RegisterViewController {
    @objc func touchRegisterButton() {
        presenter?.runRandomImageVCFlow()
    }
}

//MARK: - Setup View

private extension RegisterViewController {
    func setupView() {
        view.backgroundColor = .cyan
        addSubViews()
        setupRegisterLabel()
        setupRegisterButton()
        addActions()
    }
}

//MARK: - Setup Button

private extension RegisterViewController {
    func setupRegisterButton() {
        registerButton.setTitle("Register", for: .normal)
    }
    
    func addActions() {
        registerButton.addTarget(
            self,
            action: #selector(touchRegisterButton),
            for: .touchUpInside)
    }
}

//MARK: - Setup Label

private extension RegisterViewController {
    func setupRegisterLabel() {
        loginLabel.text = "Register"
        loginLabel.textColor = .black
    }
}

//MARK: - Setting 

private extension RegisterViewController {
    func addSubViews() {
        view.addSubview(loginLabel)
        view.addSubview(loginTF)
        view.addSubview(passwordTF)
        view.addSubview(verifyPasswordTF)
        view.addSubview(emailTF)
        view.addSubview(registerButton)
    }
}

//MARK: - Layout

private extension RegisterViewController {
    private func setupLayout() {
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        verifyPasswordTF.translatesAutoresizingMaskIntoConstraints = false
        emailTF.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginTF.topAnchor.constraint(equalTo: loginLabel.topAnchor, constant: 40),
            loginTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            loginTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            passwordTF.topAnchor.constraint(equalTo: loginTF.topAnchor, constant: 40),
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            verifyPasswordTF.topAnchor.constraint(equalTo: passwordTF.topAnchor, constant: 40),
            verifyPasswordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            verifyPasswordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            emailTF.topAnchor.constraint(equalTo: verifyPasswordTF.topAnchor, constant: 40),
            emailTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            emailTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            registerButton.topAnchor.constraint(equalTo: emailTF.topAnchor, constant: 40),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100)
        ])
    }
}

//MARK: - Protocole

extension RegisterViewController: IRegisterViewController {
    func render(viewModel: RegisterViewModel) {
        loginTF.text = viewModel.name
    }
}
