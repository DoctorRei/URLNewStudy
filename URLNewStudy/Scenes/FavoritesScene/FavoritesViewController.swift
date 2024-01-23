//
//  SettingsViewController.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import Foundation
import UIKit

protocol IFavoritesViewController: AnyObject {
    func render()
}

final class FavoritesViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<GirlCollection, LikedGirls>!
    var currentSnapshot: NSDiffableDataSourceSnapshot<GirlCollection, LikedGirls>!
    
    var presenter: IFavoritesPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureDataSource()
    }
    
    func setupView() {
        view.backgroundColor = .cyan
        navigationItem.title = "Favorites"
        setupCollectionView()
    }
}

private extension FavoritesViewController {
    func setupSubviews() {
        // скорее всего нужно будет брать сетапКолекшнвью,получать оттуда коллекцию и присваивать как эддсабвью
    }
}

private extension FavoritesViewController {
    func getSectionProvider(with sectionIndex: Int, and layoutEnvironment: NSCollectionLayoutEnvironment)
    -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupFractionalWidth = CGFloat(layoutEnvironment.container.effectiveContentSize.width > 500 ? 0.425 : 0.85)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(groupFractionalWidth),
            heightDimension: .absolute(250)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 20
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        
        return section
    }
    
    func createLayout() -> UICollectionViewLayout {
        let configure = UICollectionViewCompositionalLayoutConfiguration()
        configure.interSectionSpacing = 20
        
        let layout = UICollectionViewCompositionalLayout(sectionProvider: getSectionProvider, configuration: configure)
        
        return layout
    }
}

private extension FavoritesViewController {
    func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .gray
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

private extension FavoritesViewController {
    func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<FavoritesViewCell, LikedGirls> { cell, indexPath, image in
            cell.configure(with: image)
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { collectionView, indexPath, girl in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: girl)
        }
        
        currentSnapshot = NSDiffableDataSourceSnapshot()
        
        GirlCollection.generateCollections().forEach { girl in
            currentSnapshot.appendSections([girl])
            currentSnapshot.appendItems(girl.girls)
        }
        
        dataSource.apply(currentSnapshot, animatingDifferences: false)
    }
}

extension FavoritesViewController: IFavoritesViewController {
    func render() {
        
    }
}
