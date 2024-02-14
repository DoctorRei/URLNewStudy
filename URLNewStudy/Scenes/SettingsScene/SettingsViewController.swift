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
    let filtersButton = UIButton(configuration: .filled())
    let clearGalleryButton = UIButton(configuration: .filled())
    let logOutButton = UIButton(configuration: .filled())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Actions
    
    @objc func filtersButtonTapped() {
        presenter?.roadToFiltersScene()
    }
    
    @objc func clearGalleyButtonTapped() {
        print("TEST")
    }
    
    @objc func logOutButtonTapped() {
        presenter?.roadToLoginScene()
    }
    
    func setupButtonsActions() {
        filtersButton.addTarget(
            self,
            action: #selector(filtersButtonTapped),
            for: .touchUpInside)
        
        clearGalleryButton.addTarget(
            self,
            action: #selector(clearGalleyButtonTapped),
            for: .touchUpInside)
        
        logOutButton.addTarget(
            self,
            action: #selector(logOutButtonTapped),
            for: .touchUpInside)
    }
    
    //MARK: - Setup Buttons
    
    func setupFiltersButton() {
        filtersButton.titleLabel?.text = "Filters"
    }
    
    func setupClearGalleryButton() {
        clearGalleryButton.titleLabel?.text = "DeleteGallery"
        logOutButton.tintColor = .systemRed
    }
    
    func setupLogOutButton() {
        logOutButton.titleLabel?.text = "Log Out"
        logOutButton.tintColor = .systemRed
    }
    
    func setupSubviews() {
        view.addSubview(filtersButton)
        view.addSubview(clearGalleryButton)
        view.addSubview(logOutButton)
    }
    
    //MARK: - Layout
    
        private func setupLayout() {
            filtersButton.translatesAutoresizingMaskIntoConstraints = false
            clearGalleryButton.translatesAutoresizingMaskIntoConstraints = false
            logOutButton.translatesAutoresizingMaskIntoConstraints = false
            
            
            NSLayoutConstraint.activate([
                filtersButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.height / 4),
                filtersButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                clearGalleryButton.topAnchor.constraint(equalTo: filtersButton.bottomAnchor, constant: 100),
                clearGalleryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                logOutButton.topAnchor.constraint(equalTo: clearGalleryButton.bottomAnchor, constant: 100),
                logOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        }
    
}


extension SettingsViewController: SettingsViewControllerProtocole {
    func render() {
        print("TEST")
    }
}
