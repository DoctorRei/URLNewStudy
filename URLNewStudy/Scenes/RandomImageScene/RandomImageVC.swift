//
//  ViewController.swift
//  URLNewStudy
//
//  Created by Акира on 22.12.2023.
//

import UIKit
import Kingfisher

protocol IRandomImageVC: AnyObject {
    func render(with image: UIImage)
    func renderKF(with image: UIImageView)
}

final class RandomImageVC: UIViewController {
    
    private let testLabel = UILabel()
    private var mainImage = UIImageView()
    private let goButton = UIButton(configuration: .filled())
    
    var presenter: RandomImagePresenterProtocole?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
}

//MARK: - Actions

private extension RandomImageVC {
    @objc func touchGoButton() {
        testRender()
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
        mainImage.layer.borderColor = UIColor.white.cgColor
        
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
    func render(with image: UIImage) {
        DispatchQueue.main.async {
            self.mainImage.image = image
        }
    }
    
    func testRender() {
        presenter?.renderWithKF(imageToWorker: self.mainImage)
    }
    
    func renderKF(with image: UIImageView) {
        DispatchQueue.main.async {
            self.mainImage = image
        }
    }
    
    func testDownload() {
        guard let url = presenter?.getUrlFromApi() else { return }
        let resource = KF.ImageResource(downloadURL: URL(string: url) ?? Links.awoo.url)
        let processor = DefaultImageProcessor()

        mainImage.kf.indicatorType = .activity
        mainImage.kf.setImage(with: resource, options: [.processor(processor)]) { receivedSize, totalSize in
            let percentage = Float(receivedSize) / Float(totalSize) * 100.0
            print("Download is \(percentage)")
        } completionHandler: { (result) in
            self.hande(result)
        }
    }
    
    func hande(_ result: Result<RetrieveImageResult, KingfisherError>) {
        switch result {
        case .success(let downloadedImage):
            let image = downloadedImage.image
            let cacheType = downloadedImage.cacheType
            let source = downloadedImage.source
            let originalSource = downloadedImage.originalSource
            print("Image size: \(image.size), Cache: \(cacheType), Source: \(source), Original Source: \(originalSource)")
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
}
