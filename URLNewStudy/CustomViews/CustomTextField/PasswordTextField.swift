//
//  PasswordTextField.swift
//  URLNewStudy
//
//  Created by Акира on 18.02.2024.
//

import UIKit


final class PasswordTextField: UITextField {
    var eyeButton = UIButton(type: .custom)
    let padding = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
    
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
        setupEyeButton()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSecurityTextField() {
        isSecureTextEntry = true
        autocorrectionType = .no
        autocapitalizationType = .none
        spellCheckingType = .no
    }
    
    func setupEyeButton() {
        eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
        eyeButton.setImage(UIImage(systemName: "eye.fill"), for: .selected)
        eyeButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        eyeButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 10) // Расположение иконки в кнопке
        eyeButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        
        rightView = eyeButton
        rightViewMode = .always
    }
    
    
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rightPadding = eyeButton.frame.width + padding.right / 2
        return bounds.inset(by: UIEdgeInsets(top: padding.top, left: padding.left, bottom: padding.bottom, right: rightPadding))
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let rightPadding = eyeButton.frame.width + padding.right / 2
        return bounds.inset(by: UIEdgeInsets(top: padding.top, left: padding.left, bottom: padding.bottom, right: rightPadding))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rightPadding = eyeButton.frame.width + padding.right / 2
        return bounds.inset(by: UIEdgeInsets(top: padding.top, left: padding.left, bottom: padding.bottom, right: rightPadding))
    }
    
}

extension PasswordTextField {
    @objc func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry.toggle()
        eyeButton.isSelected.toggle()
    }
    
    
}

