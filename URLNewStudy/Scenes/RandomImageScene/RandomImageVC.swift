//
//  ViewController.swift
//  URLNewStudy
//
//  Created by Акира on 22.12.2023.
//

import UIKit

protocol RandomImageVCProtocole: AnyObject {
    func render(with image: UIImageView)
}

final class RandomImageVC: UIViewController {
    
    private var mainImage = UIImageView()
    private let goButton = UIButton(configuration: .filled())
    let tabBarAppearance = UITabBarAppearance()
    
    var presenter: RandomImagePresenterProtocole?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
 
}


//MARK: - Actions

private extension RandomImageVC {
    @objc func touchGoButton() {
        updateImage()
    }
    
    @objc func doubleTapImage() {
        presenter?.saveToStorage()
    }
}

//MARK: - Setup View

private extension RandomImageVC {
    func setupView() {
        view.backgroundColor = .white
        addSubViews()
        setupImageView()
        setupButton()
        setupLayout()
        addActions()
    }
}

//MARK: - SetupImage

private extension RandomImageVC {
    func setupImageView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(doubleTapImage))
        tapGesture.numberOfTapsRequired = 2
        mainImage.addGestureRecognizer(tapGesture)
        mainImage.isUserInteractionEnabled = true
        
        mainImage.image = UIImage(named: "imageTestForXcode")
        mainImage.contentMode = .scaleAspectFill
        mainImage.clipsToBounds = true
        
        mainImage.layer.cornerRadius = 25
        mainImage.layer.borderWidth = 2
        mainImage.layer.borderColor = UIColor.black.cgColor
    }
}

//MARK: - SetupButton

private extension RandomImageVC {
    func setupButton() {
        goButton.setTitle("GO", for: .normal)
    }
    
    func addActions() {
        goButton.addTarget(
            self,
            action: #selector(touchGoButton),
            for: .touchUpInside)
    }
}

//MARK: - Setting

private extension RandomImageVC {
    func addSubViews() {
        view.addSubview(mainImage)
        view.addSubview(goButton)
    }
}

//MARK: - Layout

private extension RandomImageVC {
    private func setupLayout() {
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        goButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            mainImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            mainImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            mainImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            mainImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65),
            
            goButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            goButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            goButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
}

//MARK: - Protocole

extension RandomImageVC: RandomImageVCProtocole {
    
    func updateImage() {
        presenter?.render(imageToWorker: self.mainImage)
    }
    
    func render(with image: UIImageView) {
        DispatchQueue.main.async {
            self.mainImage = image
        }
    }
}
