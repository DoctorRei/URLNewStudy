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
    private let likeImage = UIImageView()
    private let containerView = UIView()
    
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
        presenter?.animateLikeImage(with: likeImage)
    }
}

//MARK: - Setup View

private extension RandomImageViewController {
    func setupView() {
        view.backgroundColor = .white
        addSubViews()
        setupContainerView()
        setupImageView()
        setupLikeImage()
        setupButton()
        setupLayout()
        addActions()
    }
}

//MARK: - SetupGraphicViews

private extension RandomImageViewController {
    func setupContainerView() {
        containerView.layer.cornerRadius = 25
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.8
        containerView.layer.shadowRadius = 10
    }
    
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
    
    func setupLikeImage() {
        likeImage.image = UIImage(systemName: "heart.fill")
        likeImage.tintColor = .red
        likeImage.alpha = 0
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
        view.addSubview(goButton)
        view.addSubview(containerView)
        containerView.addSubview(mainImage)
        mainImage.addSubview(likeImage)
    }
}

//MARK: - Layout

private extension RandomImageViewController {
    private func setupLayout() {
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        goButton.translatesAutoresizingMaskIntoConstraints = false
        likeImage.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            containerView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            containerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
            
            mainImage.topAnchor.constraint(equalTo: containerView.topAnchor),
            mainImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            mainImage.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            mainImage.heightAnchor.constraint(equalTo: containerView.heightAnchor),
            
            goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goButton.widthAnchor.constraint(equalToConstant: 80),
            goButton.heightAnchor.constraint(equalToConstant: 80),
            goButton.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 10),
            
            likeImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            likeImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            likeImage.widthAnchor.constraint(equalToConstant: 70),
            likeImage.heightAnchor.constraint(equalToConstant: 70)
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
