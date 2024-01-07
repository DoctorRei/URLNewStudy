//
//  CustomTextField.swift
//  URLNewStudy
//
//  Created by Акира on 07.01.2024.
//

import UIKit

final class CustomTextField: UITextField {
    init(placeholder: String) {
        super.init(frame: .zero)
        
        self.placeholder = placeholder
        self.textAlignment = .center
        self.backgroundColor = .white
        self.alpha = 1
        self.layer.borderColor = UIColor.systemBlue.cgColor
        self.layer.borderWidth = 2.0
        self.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
