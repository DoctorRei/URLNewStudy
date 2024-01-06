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

class LoginViewController: UIViewController {
    
    let loginLabel = UILabel()
    let passwordLabel = UILabel()
    let loginTF = UITextField()
    let passwordTF = UITextField()
    let loginButton = UIButton(configuration: .filled())
    
    var loginPresenter: ILoginPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.53, green: 0.81, blue: 0.92, alpha: 1)
        
        setupSubviews()
        setupLoginLabel()
        setupLoginTF()
        setupPasswordLabel()
        setupPasswordTF()
        setupButton()
        setupLayout()
    }
    
}

//MARK: - SetupSubviews

private extension LoginViewController {
    func setupSubviews() {
        view.addSubview(loginLabel)
        view.addSubview(loginTF)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTF)
        view.addSubview(loginButton)
    }
}

//MARK: - Setup Labels

private extension LoginViewController {
    func setupLoginLabel() {
        loginLabel.text = "Login"
        loginLabel.textColor = .black
        loginLabel.textAlignment = .center
    }
    
    func setupPasswordLabel() {
        passwordLabel.text = "Password"
        passwordLabel.textColor = .black
        passwordLabel.textAlignment = .center
    }
}

//MARK: - Setup TextFields

private extension LoginViewController {
    func setupLoginTF() {
        loginTF.placeholder = "Enter your login"
        loginTF.textAlignment = .center
    }
    
    func setupPasswordTF() {
        passwordTF.placeholder = "Enter your password"
        passwordTF.textAlignment = .center
    }
}

private extension LoginViewController {
    func setupButton() {
        loginButton.setTitle("Enter", for: .normal)
    }
}

//MARK: - Layout

private extension LoginViewController {
    func setupLayout() {
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginTF.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginTF.topAnchor.constraint(equalTo: loginLabel.topAnchor, constant: 45),
            loginTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            loginTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            passwordLabel.topAnchor.constraint(equalTo: loginTF.topAnchor, constant: 45),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            passwordTF.topAnchor.constraint(equalTo: passwordLabel.topAnchor, constant: 45),
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            loginButton.topAnchor.constraint(equalTo: passwordTF.topAnchor, constant: 100),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 130),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -130),
            
        ])
    }
    
    
}

extension LoginViewController: ILoginViewController {
    
}
