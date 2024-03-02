//
//  PasswordTextField.swift
//  URLNewStudy
//
//  Created by Акира on 18.02.2024.
//

import UIKit

final class PasswordTextField: UITextField {
    
    //MARK: - Stored Property
    
    var eyeButton = UIButton(type: .custom)
    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    
    //MARK: - Init
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        setupTextField(placeholder: placeholder)
        setupSecurityTextField()
        setupEyeButton()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup View
    
    func setupTextField(placeholder: String) {
        self.placeholder = placeholder
        self.textAlignment = .center
        self.backgroundColor = .white
        self.alpha = 1
        self.layer.borderColor = UIColor.systemBlue.cgColor
        self.layer.borderWidth = 2.0
        self.layer.cornerRadius = 10
        self.textContentType = .oneTimeCode
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
        eyeButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        eyeButton.configuration?.imagePadding = 10
        
        eyeButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        
        rightView = eyeButton
        rightViewMode = .always
    }
    
    //MARK: - Ovveride methods
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rightPadding = eyeButton.frame.width + padding.right / 2 - 10
        return bounds.inset(by: UIEdgeInsets(top: padding.top, left: padding.left, bottom: padding.bottom, right: rightPadding))
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let rightPadding = eyeButton.frame.width + padding.right / 2 - 10
        return bounds.inset(by: UIEdgeInsets(top: padding.top, left: padding.left, bottom: padding.bottom, right: rightPadding))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rightPadding = eyeButton.frame.width + padding.right / 2 - 10
        return bounds.inset(by: UIEdgeInsets(top: padding.top, left: padding.left, bottom: padding.bottom, right: rightPadding))
    }
}

//MARK: - Action

extension PasswordTextField {
    @objc func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry.toggle()
        eyeButton.isSelected.toggle()
    }
}
