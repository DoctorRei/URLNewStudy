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
//        isSecureTextEntry = true
        autocorrectionType = .no
        autocapitalizationType = .none
        spellCheckingType = .no
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    let padding = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
     
     override func textRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.inset(by: padding)
     }
     
     override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.inset(by: padding)
     }
     
     override func editingRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.inset(by: padding)
     }
    
}

extension PasswordTextField {
    @objc func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry.toggle()
        eyeButton.isSelected.toggle()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
      
        
//     if text.count > 180 {
//        let index = text.index(text.startIndex, offsetBy: 180)
//        textField.text = String(text.prefix(upTo: index))
//    }
//
//    let visibleLength = min(20, text.count)
//    let hiddenLength = max(0, text.count - 40)
//
//    let visibleText = String(repeating: "*", count: visibleLength) + text.dropFirst(hiddenLength)
//
//    textField.text = visibleText
    }
}

