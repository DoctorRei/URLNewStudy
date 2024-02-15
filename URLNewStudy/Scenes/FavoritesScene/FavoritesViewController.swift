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

extension FavoritesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        render().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "\(LikedGirlsViewCell.self)",
            for: indexPath
        ) as? LikedGirlsViewCell else { return UICollectionViewCell() }
        
        let url = render()[indexPath.item]
        cell.imageView.configureForKingfisher(withURL: url)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let source = presenter?.getLikedGirlsUrls() else { return }
        presenter?.runSelectedImage(with: source, at: indexPath.row)
    }
}


//MARK: - FavoritesViewController Protocol

extension FavoritesViewController: FavoritesViewControllerProtocole {
    func render() -> [String] {
        presenter?.getLikedGirlsUrls() ?? []
    }
}
