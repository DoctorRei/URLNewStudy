//
//  SettingsViewController.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import Foundation
import UIKit

protocol ISettingsViewController: AnyObject {
    func render()
}

final class SettingsViewController: UIViewController {
    
    var presenter: ISettingsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        self.view.backgroundColor = .brown
    }
    
}

extension SettingsViewController: ISettingsViewController {
    func render() {
        
    }
    
}
