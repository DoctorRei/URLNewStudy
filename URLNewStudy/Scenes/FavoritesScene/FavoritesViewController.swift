//
//  SettingsViewController.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import UIKit

protocol FavoritesViewControllerProtocole: AnyObject {
    func render()
}

final class FavoritesViewController: UIViewController {
    
    //MARK: - Property
    
    var presenter: FavoritesPresenterProtocole?
    var collectionView: UICollectionView!
    var activityIndicator: UIActivityIndicatorView?
    lazy var source: [UIImage] = []
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupActivityIndicator()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        render()
        collectionView.reloadData()
        stopActivityIndicator()
    }
    
    func setupActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator?.center = view.center
        activityIndicator?.hidesWhenStopped = true
        view.addSubview(activityIndicator ?? UIActivityIndicatorView(style: .large))
        activityIndicator?.startAnimating()
    }
    
    func stopActivityIndicator() {
        activityIndicator?.stopAnimating()
    }
    
    //MARK: - Setup Collection
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        collectionView.register(
            LikedGirlsViewCell.self,
            forCellWithReuseIdentifier: "\(LikedGirlsViewCell.self)"
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

//MARK: - Data Source

extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "\(LikedGirlsViewCell.self)",
            for: indexPath
        ) as? LikedGirlsViewCell else { return UICollectionViewCell() }
        
        cell.imageView.image = source[indexPath.item]
        return cell
    }
}

//MARK: - FavoritesViewController Protocol

extension FavoritesViewController: FavoritesViewControllerProtocole {
    func render() {
        //TODO: - ViewWillAppear
        source = []
        self.presenter?.testKF(completion: { image in
            self.source.append(contentsOf: image)
        })
        
    }
}
