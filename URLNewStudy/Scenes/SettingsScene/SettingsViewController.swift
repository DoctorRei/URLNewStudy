//
//  GlobalSettingsViewController.swift
//  URLNewStudy
//
//  Created by Акира on 14.02.2024.
//

import UIKit

protocol SettingsViewControllerProtocole: AnyObject {
    func render()
}

class SettingsViewController: UIViewController {
    
    var presenter: SettingsPresenterProtocole?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


extension SettingsViewController: SettingsViewControllerProtocole {
    func render() {
        print("TEST")
    }
}
