//
//  SelectedImageViewController.swift
//  URLNewStudy
//
//  Created by Акира on 06.02.2024.
//

import UIKit
import Kingfisher

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
        setupView()
        setupLayout()
        setupImage()
        setupGesture()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupView() {
        setupScrollView()
        setupSelectedImage()
        setupCountLabel()
        setupSubviews()
    }
    
    func setupGesture() {
        let rightSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(
            target: self,
            action: #selector(
                handleSwipeFrom(recognizer:)))
        rightSwipe.direction = .right
        
        let leftSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(
            target: self,
            action: #selector(
                handleSwipeFrom(recognizer:)))
        leftSwipe.direction = .left
        
        scrollView.addGestureRecognizer(rightSwipe)
        scrollView.addGestureRecognizer(leftSwipe)
    }
    
   @objc func handleSwipeFrom(recognizer: UISwipeGestureRecognizer) {
        
       let direction: UISwipeGestureRecognizer.Direction = recognizer.direction
       
       switch direction {
       case UISwipeGestureRecognizer.Direction.right:
           presenter?.changeIndex(with: .minus)
       case UISwipeGestureRecognizer.Direction.left:
           presenter?.changeIndex(with: .plus)
       default:
           break
       }
       
       setupImage()
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
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            selectedImage.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor),
            selectedImage.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            selectedImage.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            selectedImage.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor),
            
            countLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            countLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            countLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            countLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setupImage() {
        let url = URL(string: presenter?.setupPhoto() ?? "")
        selectedImage.kf.setImage(with: url)
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
