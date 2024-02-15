//
//  CollectionViewCell.swift
//  URLNewStudy
//
//  Created by Акира on 11.02.2024.
//

import UIKit

/// Кастомная ячейка. Используется для отображения фильтров поиска картинок
/// В ней есть titleLabel (лейбл, в котором пишется названия фильтра)
/// filterSwitch (свич) для отображения выбранных фильтров пользователем
/// switchActionHandler - хендлер, который позволяет задавать логику при взаимодействии со свичом
/// при изменении положения свитча вызывается хендлер, который в зависимости от положения свитча
/// реализует логику, которая задается в коллекции при конфигурации ячейки

final class FiltersViewCell: UICollectionViewCell {
    
    static let cellIdentifer = "SettingsViewCell"
    
    var titleLabel = UILabel()
    var filterSwitch = UISwitch()
    var switchActionHandler: ((Bool) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
        setupSwitch()
        setupContentView()
        setupSubviews()
        setupConstraints()
    }
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        switchActionHandler?(sender.isOn)
    }
    
    func setupLabel() {
        titleLabel = UILabel(frame: bounds)
        titleLabel.textAlignment = .left
    }
    
    func setupSwitch() {
        filterSwitch.addTarget(
            self,
            action: #selector(switchValueChanged(_:)),
            for: .valueChanged)
    }
    
    func setupContentView() {
        contentView.backgroundColor = .white
    }
    
    func setupSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(filterSwitch)
    }
    
    @available(*, unavailable)
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
            filterSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
