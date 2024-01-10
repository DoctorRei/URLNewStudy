//
//  LoginScene.swift
//  URLNewStudy
//
//  Created by Акира on 24.12.2023.
//

import Foundation
import UIKit

protocol ILoginViewController: AnyObject {
    
}

final class LoginViewController: UIViewController {
    
    let loginLabel = UILabel()
    let loginTF = CustomTextField(placeholder: "Enter you'r login")
    let passwordTF = CustomTextField(placeholder: "Enter you'r password")
    let loginButton = UIButton(configuration: .filled())
    let registerButton = UIButton(configuration: .filled())
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    
    var loginPresenter: ILoginPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

//MARK: - Actions

private extension LoginViewController {
    @objc func touchRegisterButton() {
        loginPresenter?.runRegisterFlow()
    }
    
    @objc func touchEnterButton() {
        let viewModelLogin = ViewModelLogin(login: loginTF.text ?? "", password: passwordTF.text ?? "")
        loginPresenter?.logIn(viewModel: viewModelLogin)
    }
}

//MARK: - View Settings

private extension LoginViewController {
    func setupViews() {
        setupSubviews()
        setupTFDelegate()
        setupImage()
        setupLabels()
        setupButtons()
        setupLayout()
        addActions()
    }
}

//MARK: - SetupSubviews

private extension LoginViewController {
    func setupSubviews() {
        view.addSubview(loginLabel)
        view.addSubview(loginTF)
        view.addSubview(passwordTF)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        view.insertSubview(backgroundImage, at: 0)
    }
}

//MARK: - Setup Background Image

private extension LoginViewController {
    func setupImage() {
        backgroundImage.image = UIImage(named: "AnimeGirls")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        backgroundImage.alpha = 0.5
    }
}

//MARK: - Setup Labels

private extension LoginViewController {
    func setupLabels() {
        setupLoginLabel()
    }
    
    func setupLoginLabel() {
        loginLabel.text = "Login"
        loginLabel.textColor = .black
        loginLabel.textAlignment = .center
        loginLabel.textColor = .white
        loginLabel.shadowColor = .black
        loginLabel.font = UIFont.systemFont(ofSize: 30)
    }
}

//MARK: - Setup TextFields

private extension LoginViewController {
    func setupTFDelegate() {
        loginTF.delegate = self
    }
    
    //TODO: - нужно выставить полю сокрытие вводимых данных, убрать автозамену слов и т9. 
    
}

//MARK: - Button Settings

private extension LoginViewController {
    func setupButtons() {
        setupLoginButton()
        setupRegisterButton()
    }
    
    func setupLoginButton() {
        loginButton.setTitle("Enter", for: .normal)
    }
    
    func setupRegisterButton() {
        registerButton.setTitle("Register", for: .normal)
    }
    
    func addActions() {
        registerButton.addTarget(
            self,
            action: #selector(touchRegisterButton),
            for: .touchUpInside)
        
        loginButton.addTarget(
            self,
            action: #selector(touchEnterButton),
            for: .touchUpInside)
    }
}

//MARK: - Layout

private extension LoginViewController {
    func setupLayout() {
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginTF.topAnchor.constraint(equalTo: loginLabel.topAnchor, constant: 40),
            loginTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            loginTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            passwordTF.topAnchor.constraint(equalTo: loginTF.topAnchor, constant: 40),
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            loginButton.topAnchor.constraint(equalTo: passwordTF.topAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.topAnchor, constant: 40),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100)
        ])
    }
}

//MARK: - Delegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }

        loginPresenter?.getLogin(Login: text)
    }
}

//MARK: - Protocole

extension LoginViewController: ILoginViewController {
    
}
