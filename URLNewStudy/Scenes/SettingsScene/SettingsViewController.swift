//
//  SettingsViewController.swift
//  URLNewStudy
//
//  Created by Акира on 20.01.2024.
//

import UIKit

protocol SettingsViewControllerProtocole: AnyObject {
    func render()
}

final class SettingsViewController: UIViewController {
    
    var presenter: SettingsPresenterProtocole?
    var activityIndicator = UIActivityIndicatorView(style: .large)
    var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewLayout()
    )
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        setupCollectionView()
        setupLayout()
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: setupFlowLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SettingsViewCell.self, forCellWithReuseIdentifier: "SettingsViewCell")
        view.addSubview(collectionView)
    }
    
    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        return layout
    }
    
    func setupLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension SettingsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.getLinks().count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SettingsViewCell.cellIdentifer,
            for: indexPath) as? SettingsViewCell else { return UICollectionViewCell()}
        
        let links = presenter?.getLinks()
        cell.titleLabel.text = links?[indexPath.item].rawValue.capitalized
        
        cell.switchActionHandler = { [weak self] isOn in
            switch indexPath.item {
            case 0:
                if isOn {
                    print("First Switch is ON")
                } else {
                    print("First Switch is OFF")
                }
            case 1:
                if isOn {
                    print("Second Switch is ON")
                } else {
                    print("Second Switch is OFF")
                }
            default:
                break
            }
            
        }
        
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            return CGSize(width: collectionView.bounds.width, height: 50)
        }
}

extension SettingsViewController: SettingsViewControllerProtocole {
    func render() {
        
    }
    
}
