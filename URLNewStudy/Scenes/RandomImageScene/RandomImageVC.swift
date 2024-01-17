//
//  ViewController.swift
//  URLNewStudy
//
//  Created by Акира on 22.12.2023.
//

import UIKit

protocol IRandomImageVC: AnyObject {
    func render()
}

final class RandomImageVC: UIViewController {
    
    private let testLabel = UILabel()
    private var mainImage = UIImageView()
    private let getButton = UIButton(configuration: .filled())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
}

//MARK: - Setup View

private extension RandomImageVC {
    func setupView() {
        view.backgroundColor = .cyan
        addSubViews()
        setupRandomImageLabel()
        setupImageView()
        setupButton()
        setupLayout()
    }
}

//MARK: - Setup Label

private extension RandomImageVC {
    func setupRandomImageLabel() {
        testLabel.text = "Welcome"
        testLabel.textColor = .black
    }
}

//MARK: - SetupImage

private extension RandomImageVC {
    func setupImageView() {
        mainImage.image = UIImage(named: "imageTestForXcode")
        mainImage.contentMode = .scaleAspectFill
        mainImage.clipsToBounds = true
        
        mainImage.layer.cornerRadius = 25
        mainImage.layer.borderWidth = 2
        mainImage.layer.borderColor = UIColor.white.cgColor
        
    }
}

//MARK: - SetupButton

private extension RandomImageVC {
    func setupButton() {
        getButton.setTitle("GO", for: .normal)
    }
}

//MARK: - Setting

private extension RandomImageVC {
    func addSubViews() {
        view.addSubview(testLabel)
        view.addSubview(mainImage)
        view.addSubview(getButton)
    }
}

//MARK: - Layout

private extension RandomImageVC {
    private func setupLayout() {
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        getButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            testLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            testLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainImage.topAnchor.constraint(equalTo: testLabel.bottomAnchor, constant: 30),
            mainImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImage.widthAnchor.constraint(equalToConstant: 310),
            mainImage.heightAnchor.constraint(equalToConstant: 510),
            
            getButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            getButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            getButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
            
        ])
    }
}


//MARK: - Protocole

extension RandomImageVC: IRandomImageVC {
    func render() {
        print("Тут будут данные с экрана")
    }
}
