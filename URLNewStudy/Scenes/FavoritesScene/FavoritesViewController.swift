//
//  SettingsViewController.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import UIKit

protocol IFavoritesViewController: AnyObject {
    func render()
}

final class FavoritesViewController: UIViewController {
    
    //MARK: - Property
    
    var presenter: IFavoritesPresenter?
    var collectionView: UICollectionView!
    var source = Source.randomPhotos(with: 20)
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
    }
    
    //MARK: - Setup Collection
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        collectionView.dataSource = self
        collectionView.backgroundColor = .cyan
        
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
        ) as? LikedGirlsViewCell else { return UICollectionViewCell()}
        
        cell.imageView.image = UIImage(named: source[indexPath.item].imageName)
        return cell
    }
}

//MARK: - IFavoritesViewController Protocol

extension FavoritesViewController: IFavoritesViewController {
    func render() {
        
    }
}
