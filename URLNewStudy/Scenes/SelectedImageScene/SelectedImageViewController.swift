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
    
    //MARK: - Stored Property
    
    var presenter: SelectedImagePresenterProtocole?
    private let scrollView = UIScrollView()
    private var selectedImage = UIImageView()
    private let countLabel = UILabel()
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationButton()
        setupView()
        setupLayout()
        setupContent()
        setupGesture()
    }
    
    //MARK: - ViewWillDisappear
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    
    // MARK: - Setup Gestures
    
    /// Обрабатываем жесты свайпа вправо и влево для дальнейшего перехода между экранами
    
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
    
    ///  Переход между экранами.
    ///  При свайпе слева-направо срабатывает метод презентора, который обращается к методу changeIndex
    ///  Этот метод принимает таргет своего enum. Всего два кейса .minus и .plus
    ///  Минус - уходим на индекс -1 и смотрим картинку по этому индексу
    ///  Плюс - уходим на индекс +1 и смотрим картинку по этому индексу
    ///  После этого мы обновляем картинку и лейбл с новыми данными
    
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
        setupContent()
    }
    
    //MARK: - Actions
    
    /// Устанавливаем кнопки для нашего меню настроек
    
    func setupMenuActions() -> [UIAction] {
        let actions = [
            UIAction(
                title: "Copy image URL",
                image: UIImage(systemName: "doc.on.doc"),
                handler: { _ in
                    guard let url = self.presenter?.getImageUrl() else { return }
                    UIPasteboard.general.string = url
                    print(url)
                }),
            UIAction(
                title: "Delete image",
                image: UIImage(systemName: "trash"),
                handler: { _ in
                    self.presenter?.changeIndex(with: .delete)
                    self.setupContent()
                })
            
        ]
        return actions
    }
    
    //MARK: - SetupNavigationBar
    
    func setupNavigationButton() {
        let backButton = UIBarButtonItem(
            title: "< Back",
            style: .plain,
            target: navigationController,
            action: #selector(navigationController?.popWithNewAnimation)
        )
        
        let menuButton = UIBarButtonItem(
            title: "Settings",
            image: UIImage(systemName: "gearshape"),
            target: self, action: nil)
        
        menuButton.menu = .init(children: setupMenuActions())
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItem = menuButton
    }
    
    //MARK: - Setup UI
    
    func setupView() {
        setupScrollView()
        setupSelectedImage()
        setupCountLabel()
        setupSubviews()
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
    
    func setupContent() {
        let url = URL(string: presenter?.getImageUrl() ?? "")
        selectedImage.kf.setImage(with: url)
        countLabel.text = presenter?.setupLabel()
    }
    
    func setupSubviews() {
        view.addSubview(scrollView)
        view.addSubview(countLabel)
        scrollView.addSubview(selectedImage)
    }
    
    //MARK: - Layout
    
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
            countLabel.heightAnchor.constraint(equalToConstant: 20),
            countLabel.topAnchor.constraint(equalTo: selectedImage.bottomAnchor, constant: 10)
        ])
    }
}

//MARK: - Setup Scroll View

extension SelectedImageViewController: UIScrollViewDelegate {
    func setupScrollView() {
        scrollView.contentMode = .scaleAspectFit
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .white
        
        scrollView.delegate = self // В будущем реализую зум
    }
}

extension SelectedImageViewController: SelectedImageViewControllerProtocole {
    func render() {
        
    }
}
