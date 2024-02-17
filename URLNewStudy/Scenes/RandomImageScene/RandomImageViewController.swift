//
//  ViewController.swift
//  URLNewStudy
//
//  Created by Акира on 22.12.2023.
//

import UIKit

protocol RandomImageViewControllerProtocole: AnyObject {
    func render(with image: UIImageView)
}

final class RandomImageViewController: UIViewController {
    
    //MARK: - StoredPropertys
    
    private var mainImage = UIImageView()
    private let goButton = UIButton(configuration: .filled())
    var presenter: RandomImagePresenterProtocole?
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Actions

private extension RandomImageViewController {
    @objc func touchGoButton() {
        updateImage()
    }
    
    @objc func doubleTapImage() {
        presenter?.saveToStorage()
    }
}

//MARK: - Setup View

private extension RandomImageViewController {
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

private extension RandomImageViewController {
    func setupImageView() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(doubleTapImage)
        )
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

private extension RandomImageViewController {
    func setupButton() {
        goButton.setTitle("GO", for: .normal)
        goButton.configuration?.cornerStyle = .capsule
    }
    
    func addActions() {
        goButton.addTarget(
            self,
            action: #selector(touchGoButton),
            for: .touchUpInside)
    }
}

//MARK: - Setting

private extension RandomImageViewController {
    func addSubViews() {
        view.addSubview(mainImage)
        view.addSubview(goButton)
    }
}

//MARK: - Layout

private extension RandomImageViewController {
    private func setupLayout() {
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        goButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            mainImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            mainImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            mainImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
            
            goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goButton.widthAnchor.constraint(equalToConstant: 80),
            goButton.heightAnchor.constraint(equalToConstant: 80),
            goButton.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 10)
        ])
    }
}

//MARK: - Protocole

extension RandomImageViewController: RandomImageViewControllerProtocole {
    
    func updateImage() {
        presenter?.render(imageToWorker: self.mainImage)
    }
    
    func render(with image: UIImageView) {
        DispatchQueue.main.async {
            self.mainImage = image
        }
    }
}
