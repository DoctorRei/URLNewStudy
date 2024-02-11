//
//  CollectionViewCell.swift
//  URLNewStudy
//
//  Created by Акира on 11.02.2024.
//

import UIKit

class SettingsViewCell: UICollectionViewCell {
    
    static let cellIdentifer = "SettingsViewCell"
    
    var titleLabel = UILabel()
    var filterSwitch = UISwitch()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
        setupSwitch()
        setupContentView()
        setupSubviews()
        setupConstraints()
    }
    
    func setupLabel() {
        titleLabel = UILabel(frame: bounds)
        titleLabel.textAlignment = .left
    }
    
    func setupSwitch() {
        
    }
    
    func setupContentView() {
        contentView.backgroundColor = .systemBlue
    }
    
    func setupSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(filterSwitch)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        filterSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: (contentView.frame.height / 5) + (contentView.frame.height / 10)),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            
            filterSwitch.topAnchor.constraint(equalTo: contentView.topAnchor, constant: contentView.frame.height / 5),
            filterSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
