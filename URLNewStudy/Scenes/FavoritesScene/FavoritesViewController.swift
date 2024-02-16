//
//  SettingsViewController.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import UIKit


protocol FavoritesViewControllerProtocole: AnyObject {
    func render() -> [String]
}

final class FavoritesViewController: UIViewController {
    
    //MARK: - Property
    
    var presenter: FavoritesPresenterProtocole?
    var collectionView: UICollectionView!
    var activityIndicator: UIActivityIndicatorView?
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupActivityIndicator()
        activityIndicator?.startAnimating()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
        stopActivityIndicator()
    }

    //MARK: - Actions
    
    /// Здесь мы настраиваем действия для меню ячеек коллекции
    
    func setupMenuActions(with index: Int) -> [UIAction] {
        let actions = [
            UIAction(
                title: "Copy image URL",
                image: UIImage(systemName: "doc.on.doc"),
                handler: { _ in
                    guard let url = self.presenter?.getImageUrl(with: index) else { return }
                    UIPasteboard.general.string = url
                    print(url)
                }),
            UIAction(
                title: "Delete image",
                image: UIImage(systemName: "trash"),
                handler: { _ in
                    print("1")
                })
        ]
        return actions
    }
    
    //MARK: - Setup Activity Indicator
    
    func setupActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator?.center = view.center
        activityIndicator?.hidesWhenStopped = true
        view.addSubview(activityIndicator ?? UIActivityIndicatorView(style: .large))
    }
    
    func stopActivityIndicator() {
        activityIndicator?.stopAnimating()
    }
    
    //MARK: - Setup Collection
    
    func setupCollectionView() {
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: setupFlowLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        collectionView.register(
            FavoritesViewCell.self,
            forCellWithReuseIdentifier: "\(FavoritesViewCell.self)"
        )
    }
    
    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = .init(top: 10, left: 25, bottom: 10, right: 25)
        
        return layout
    }
}

//MARK: - Data Source, Delegate protocole

extension FavoritesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        render().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "\(FavoritesViewCell.self)",
            for: indexPath
        ) as? FavoritesViewCell else { return UICollectionViewCell() }
        
        let url = render()[indexPath.item]
        cell.imageView.configureForKingfisher(withURL: url)
        
        return cell
    }
    
    /// Переход на сцену SelectedImage по выбранной фотографии. По тапу обращаемся в презентер
    /// Тот дергает роутер и роутер собирает сцену, запушив нас на новую сцену с выбранной картинкой
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let source = presenter?.getLikedGirlsUrls() else { return }
        presenter?.runSelectedImage(with: source, at: indexPath.row)
    }
    
    /// Настройка Menu для элементов коллекции
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemsAt indexPaths: [IndexPath], point: CGPoint) -> UIContextMenuConfiguration? {
        let actions = setupMenuActions(with: indexPaths.first?.row ?? 0)
        let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            UIMenu(title: "What do you want to do?", children: actions)
        }
        return configuration
    }
  
    
}

//MARK: - FavoritesViewController Protocol

extension FavoritesViewController: FavoritesViewControllerProtocole {
    func render() -> [String] {
        presenter?.getLikedGirlsUrls() ?? []
    }
}
