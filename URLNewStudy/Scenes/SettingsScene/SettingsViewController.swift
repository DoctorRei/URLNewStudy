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
        setupViews()
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
    
    //MARK: - SetupViews
    
    func setupViews() {
        setupButtons()
        setupSubviews()
        setupLayout()
    }
    
    //MARK: - Setup Buttons
    
    func setupButtons() {
        setupFiltersButton()
        setupClearGalleryButton()
        setupLogOutButton()
        setupButtonsActions()
    }
    
    func setupFiltersButton() {
        filtersButton.setTitle("Filters", for: .normal)
    }
    
    func setupClearGalleryButton() {
        clearGalleryButton.setTitle("Clear Gallery", for: .normal)
        clearGalleryButton.tintColor = .systemRed
    }
    
    func setupLogOutButton() {
        logOutButton.setTitle("Log Out", for: .normal)
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
                filtersButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
                filtersButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
                filtersButton.heightAnchor.constraint(equalToConstant: 30),
                
                clearGalleryButton.topAnchor.constraint(equalTo: filtersButton.bottomAnchor, constant: 100),
                clearGalleryButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
                clearGalleryButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
                clearGalleryButton.heightAnchor.constraint(equalToConstant: 30),
                
                logOutButton.topAnchor.constraint(equalTo: clearGalleryButton.bottomAnchor, constant: 100),
                logOutButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
                logOutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
                logOutButton.heightAnchor.constraint(equalToConstant: 30)
            ])
        }
}


extension SettingsViewController: SettingsViewControllerProtocole {
    func render() {
        print("TEST")
    }
}
