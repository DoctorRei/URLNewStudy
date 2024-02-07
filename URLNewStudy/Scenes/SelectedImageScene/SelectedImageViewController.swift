//
//  SelectedImageViewController.swift
//  URLNewStudy
//
//  Created by Акира on 06.02.2024.
//

import UIKit

protocol SelectedImageViewControllerProtocole: AnyObject {
    func render()
}

final class SelectedImageViewController: UIViewController  {

    var presenter: SelectedImagePresenterProtocole?
    private let scrollView = UIScrollView()
    private var selectedImage = UIImageView()
    private let countLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupSelectedImage()
        setupCountLabel()
        setupSubviews()
        setupLayout()
        setupImage()
        
    }
    
    func setupView() {
       
    }
    
    func setupSelectedImage() {
        selectedImage.contentMode = .scaleAspectFit
        selectedImage.clipsToBounds = true
        selectedImage.isUserInteractionEnabled = true
    }
    
    func setupCountLabel() {
        countLabel.textColor = .black
        countLabel.textAlignment = .center
    }
    
    func setupSubviews() {
        view.addSubview(scrollView)
        view.addSubview(countLabel)
        scrollView.addSubview(selectedImage)
    }
    
    func setupLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        selectedImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            selectedImage.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor),
            selectedImage.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            selectedImage.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            selectedImage.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        countLabel.frame = CGRect(
            x: 20,
            y: view.frame.height - 50,
            width: view.frame.width - 40,
            height: 21)
    }
    
    func setupImage() {
        selectedImage.image = presenter?.setupPhoto()
        countLabel.text = presenter?.setupLabel()
    }
}

extension SelectedImageViewController: UIScrollViewDelegate {
    func setupScrollView() {
        scrollView.contentMode = .scaleAspectFit
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .white
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 6
        
        scrollView.delegate = self
    }
    
}

extension SelectedImageViewController: SelectedImageViewControllerProtocole {
    func render() {
        
    }
}
