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
    
    
    var loginPresenter: ILoginPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.53, green: 0.81, blue: 0.92, alpha: 1)
        
        setupSubviews()
        setupLabel()
        setupLayout()
    }
    
}

private extension LoginViewController {
    func setupSubviews() {
        view.addSubview(loginLabel)
    }
    
    func setupLabel() {
        loginLabel.text = "Login"
        loginLabel.textColor = .blue
    }
}

private extension LoginViewController {
    func setupLayout() {
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        ])
        
    }
    
    
}

extension LoginViewController: ILoginViewController {
     
}
