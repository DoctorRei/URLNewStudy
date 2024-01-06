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
    let passwordLabel = UILabel()
    let loginTF = UITextField()
    let passwordTF = UITextField()
    let loginButton = UIButton(configuration: .filled())
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    
    var loginPresenter: ILoginPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        setupImage()
        setupLabels()
        setupTextFields()
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
        view.insertSubview(backgroundImage, at: 0)
    }
}

//MARK: - Setup Background Image

private extension LoginViewController {
    func setupImage() {
        backgroundImage.image = UIImage(named: "AnimeGirls")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
    }
}

//MARK: - Setup Labels

private extension LoginViewController {
    func setupLabels() {
        setupLoginLabel()
        setupPasswordLabel()
    }
    
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
    func setupTextFields() {
        setupLoginTF()
        setupPasswordTF()
    }
    
    func setupLoginTF() {
        loginTF.placeholder = "Enter your login"
        loginTF.textAlignment = .center
        
        loginTF.backgroundColor = .white
        loginTF.alpha = 1
        
        loginTF.layer.borderColor = UIColor.systemBlue.cgColor
        loginTF.layer.borderWidth = 2.0
        loginTF.layer.cornerRadius = 10
    }
    
    func setupPasswordTF() {
        passwordTF.placeholder = "Enter your password"
        passwordTF.textAlignment = .center
        
        passwordTF.backgroundColor = .white
        passwordTF.alpha = 1
        
        passwordTF.layer.borderColor = UIColor.systemBlue.cgColor
        passwordTF.layer.borderWidth = 2.0
        passwordTF.layer.cornerRadius = 10
        
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
            
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginTF.topAnchor.constraint(equalTo: loginLabel.topAnchor, constant: 25),
            loginTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            loginTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
//            passwordLabel.topAnchor.constraint(equalTo: loginTF.topAnchor, constant: 45),
//            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
//            passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            passwordTF.topAnchor.constraint(equalTo: loginTF.topAnchor, constant: 45),
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            loginButton.topAnchor.constraint(equalTo: passwordTF.topAnchor, constant: 70),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
        ])
    }
    
    
}

extension LoginViewController: ILoginViewController {
    
}
