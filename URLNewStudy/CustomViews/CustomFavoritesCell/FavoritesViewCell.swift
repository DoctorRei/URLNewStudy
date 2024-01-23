//
//  CollectionViewCell.swift
//  URLNewStudy
//
//  Created by Акира on 22.01.2024.
//

import UIKit

class FavoritesViewCell: UICollectionViewCell {
    private let imageView = UIImageView()
    private let descriptionLabel = UILabel()
    private let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout() 
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension FavoritesViewCell {
    func configure(with girls: LikedGirls) {
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 2
        imageView.layer.cornerRadius = 4
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: girls.image)
        
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.text = girls.description
        
        nameLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.textColor = .placeholderText
        nameLabel.text = girls.name
    }
}

extension FavoritesViewCell {
    func setupLayout() {
        [imageView, descriptionLabel, nameLabel].forEach { cell in
            cell.translatesAutoresizingMaskIntoConstraints = false
        }
        
        contentView.addSubview(imageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constant.spacing),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    enum Constant {
        static let spacing: CGFloat = 10
    }
}
