//
//  LikedGirlsViewCell.swift
//  URLNewStudy
//
//  Created by Акира on 24.01.2024.
//

import UIKit

/// Настройка ячеек коллекции для FavoritesScene.
/// Здесь мы задаем базовые размеры изображения (100х100)
/// Саму картинку в imageView
/// В setupCell() мы задаем контент мод, рамку для изображения
/// Констреинты

class FavoritesViewCell: UICollectionViewCell {
    var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        self.contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 1
        
        self.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}
