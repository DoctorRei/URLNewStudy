//
//  PasswordTextField.swift
//  URLNewStudy
//
//  Created by Акира on 18.02.2024.
//

import UIKit


final class PasswordTextField: UITextField {

    var eyeButton = UIButton(type: .custom)
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        self.placeholder = placeholder
        self.textAlignment = .center
        self.backgroundColor = .white
        self.alpha = 1
        self.layer.borderColor = UIColor.systemBlue.cgColor
        self.layer.borderWidth = 2.0
        self.layer.cornerRadius = 10
        
        setupSecurityTextField()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSecurityTextField() {
        isSecureTextEntry = false
        autocorrectionType = .no
        autocapitalizationType = .none
        spellCheckingType = .no
    }
    
    
}

extension PasswordTextField {
    @objc func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry.toggle()
        eyeButton.isSelected.toggle()
    }
}
