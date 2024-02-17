//
//  GlobalSettingsViewController.swift
//  URLNewStudy
//
//  Created by Акира on 14.02.2024.
//

import UIKit
import SnapKit

protocol SettingsViewControllerProtocole: AnyObject {
    func render()
}

class SettingsViewController: UIViewController {
    var presenter: SettingsPresenterProtocole?
    let filtersButton = UIButton(configuration: .filled())
    let clearGalleryButton = UIButton(configuration: .filled())
    let logOutButton = UIButton(configuration: .filled())
    let githubButton = UIButton(configuration: .filled())
    let profileImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
    let nameLabel = UILabel()
    let statusLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK: - Actions
    
    @objc func filtersButtonTapped() {
        presenter?.roadToFiltersScene()
    }
    
    @objc func clearGalleyButtonTapped() {
        presenter?.clearGallery()
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
        setupImageView()
        setupNameLabel()
        setupStatusLabel()
        
        setupLayout()
    }
    
    //MARK: - ImageView
    
    func setupImageView() {
        profileImage.configureForKingfisher(withURL: "https://sun9-78.userapi.com/impg/Iqyqf4gMXLqxJqYi5LWw8SmWw35zvU4DEVtPWQ/2Knp5gVMgC4.jpg?size=864x1080&quality=95&sign=392a8a0a1db5e2e1af46aaf3b405bd22&type=album", width: 150, height: 150)
        profileImage.clipsToBounds = true
        profileImage.layer.borderWidth = 1
        profileImage.layer.borderColor = UIColor.black.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
    }
    
    //MARK: - Setup Labels
    
    func setupNameLabel() {
        nameLabel.text = "Akira Rei"
        nameLabel.font = .boldSystemFont(ofSize: 24)
        nameLabel.textAlignment = .center
    }
    
    func setupStatusLabel() {
        statusLabel.text = "Я ищу работу. Ребят, я чертовски хорош. Не самый умный, конечно, но усидчивый как черт и талантливый"
        statusLabel.font = .italicSystemFont(ofSize: 14)
        statusLabel.textAlignment = .center
        statusLabel.numberOfLines = 3
    }
    
    //MARK: - Setup Buttons
    
    func setupButtons() {
        setupFiltersButton()
        setupClearGalleryButton()
        setupLogOutButton()
        setupGitHubButton()
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
    
    func setupGitHubButton() {
        githubButton.setTitle("My GitHub", for: .normal)
    }
    
    //MARK: - Layout
    
    func setupSubviews() {
        view.addSubview(filtersButton)
        view.addSubview(clearGalleryButton)
        view.addSubview(logOutButton)
        view.addSubview(githubButton)
        view.addSubview(profileImage)
        view.addSubview(nameLabel)
        view.addSubview(statusLabel)
    }
    
    private func setupLayout() {
        
        profileImage.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(view.frame.size.height / 11)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(20)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(view.snp.width).inset(70)
        }
        
        githubButton.snp.makeConstraints { make in
            make.top.equalTo(statusLabel.snp.bottom).offset(20)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(view.snp.width).inset(70)
        }
        
        filtersButton.snp.makeConstraints { make in
            make.top.equalTo(githubButton.snp.bottom).offset(10)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(view.snp.width).inset(70)
        }
        
        clearGalleryButton.snp.makeConstraints { make in
            make.top.equalTo(filtersButton.snp.bottom).offset(10)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(view.snp.width).inset(70)
        }
        
        logOutButton.snp.makeConstraints { make in
            make.top.equalTo(clearGalleryButton.snp.bottom).offset(10)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(view.snp.width).inset(70)
        }
        
    }
}


extension SettingsViewController: SettingsViewControllerProtocole {
    func render() {
        print("TEST")
    }
}
