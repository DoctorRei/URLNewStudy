//
//  SettingsViewController.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import UIKit

protocol ISettingsViewController: AnyObject {
    func render()
}

final class SettingsViewController: UIViewController {
    
    var presenter: ISettingsPresenter?
    var activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupActivityIndicator()
        
    }
    
    func setupView() {
        
    }
    
    func setupActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
    }
    
}

extension SettingsViewController: ISettingsViewController {
    func render() {
        
    }
    
}
