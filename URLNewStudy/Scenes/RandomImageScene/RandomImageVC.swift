//
//  ViewController.swift
//  URLNewStudy
//
//  Created by Акира on 22.12.2023.
//

import UIKit

protocol IRandomImageVC: AnyObject {
    func render(with image: UIImageView)
}

final class RandomImageVC: UIViewController {
    
    private let testLabel = UILabel()
    private var mainImage = UIImageView()
    private let goButton = UIButton(configuration: .filled())
    let tabBarAppearance = UITabBarAppearance()
    
    var presenter: RandomImagePresenterProtocole?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        tabBarAppearance.configureWithOpaqueBackground()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.alpha = 0
        
        tabBarAppearance.configureWithOpaqueBackground()
    }
}


//MARK: - Actions

private extension RandomImageVC {
    @objc func touchGoButton() {
        updateImage()
    }
    
    @objc func touchImage() {
        presenter?.saveToStorage()
        
        print("Сработал тач")
    }
}

//MARK: - Setup View

private extension RandomImageVC {
    func setupView() {
        view.backgroundColor = .white
        addSubViews()
        setupRandomImageLabel()
        setupImageView()
        setupButton()
        setupLayout()
        addActions()
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchImage))
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
        view.addSubview(testLabel)
        view.addSubview(mainImage)
        view.addSubview(goButton)
    }
}

//MARK: - Layout

private extension RandomImageVC {
    private func setupLayout() {
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        goButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            testLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            testLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainImage.topAnchor.constraint(equalTo: testLabel.bottomAnchor, constant: 30),
            mainImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImage.widthAnchor.constraint(equalToConstant: 310),
            mainImage.heightAnchor.constraint(equalToConstant: 510),
            
            goButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            goButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            goButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
}

//MARK: - Protocole

extension RandomImageVC: IRandomImageVC {
    
    func updateImage() {
        presenter?.render(imageToWorker: self.mainImage)
    }
    
    func render(with image: UIImageView) {
        DispatchQueue.main.async {
            self.mainImage = image
        }
    }
}
