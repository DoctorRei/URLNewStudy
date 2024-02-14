//
//  LoginScene.swift
//  URLNewStudy
//
//  Created by Акира on 24.12.2023.
//

import UIKit

protocol LoginViewControllerProtocole: AnyObject {
    
}

final class LoginViewController: UIViewController {
    let loginLabel = UILabel()
    let loginTF = CustomTextField(placeholder: "Enter you'r login")
    let passwordTF = CustomTextField(placeholder: "Enter you'r password")
    let loginButton = UIButton(configuration: .filled())
    let registerButton = UIButton(configuration: .filled())
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    
    var presenter: LoginPresenterProtocole?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupViews()
    }
}

//MARK: - Actions

private extension LoginViewController {
    @objc func touchRegisterButton() {
        presenter?.runRegisterFlow()
    }
    
    @objc func touchEnterButton() {
        guard let password = passwordTF.text else {return}
        guard let login = loginTF.text else {return}
        presenter?.validatePassword(login: login, password: password)
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
        backgroundImage.alpha = 0.7
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
        passwordTF.delegate = self
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
        loginButton.configuration?.cornerStyle = .capsule
    }
    
    func setupRegisterButton() {
        registerButton.setTitle("Register", for: .normal)
        registerButton.configuration?.cornerStyle = .capsule
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
            
            loginLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.height / 5),
            loginLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            loginTF.topAnchor.constraint(equalTo: loginLabel.topAnchor, constant: 40),
            loginTF.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            loginTF.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            loginTF.heightAnchor.constraint(equalToConstant: 25),
            
            passwordTF.topAnchor.constraint(equalTo: loginTF.topAnchor, constant: 30),
            passwordTF.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            passwordTF.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            passwordTF.heightAnchor.constraint(equalToConstant: 25),
            
            loginButton.topAnchor.constraint(equalTo: passwordTF.topAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.topAnchor, constant: 40),
            registerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            registerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100)
        ])
    }
}

//MARK: - Delegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }

        if textField == loginTF {
            presenter?.getLogin(login: text)
        } else {
            presenter?.getPassword(password: text)
        }
    }
}

//MARK: - Protocole

extension LoginViewController: LoginViewControllerProtocole {
    
}
