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
    private var activityIndicator = UIActivityIndicatorView(style: .large)
    private var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewLayout()
    )
    private var selectedFilters: [String] = []
    private var links: [Links] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        setupCollectionView()
        setupLayout()
        setupSources()
    }
    
    /// Берем данные из презентера и присваиваем их тут для дальнейшей конфигурации ячейки
    
    private func setupSources() {
        selectedFilters = presenter?.loadFilters() ?? []
        links = presenter?.getLinks() ?? []
    }
    
    /// Базовая настройка коллекции
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: setupFlowLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SettingsViewCell.self, forCellWithReuseIdentifier: "SettingsViewCell")
        view.addSubview(collectionView)
    }
    
    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        return layout
    }
    
    /// Устанавливаем констреинты
    
    private func setupLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

/// Создаем список на основе списка ссылок на наши API

extension SettingsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.getLinks().count ?? 1
    }
    
    /// Создаем и настраиваем ячейки
    /// Создаем ячейку и кастим ее до типа нашей кастомной ячейки SettingsViewCell
    /// Присваиваем ей текст на основе наших ссылок на API , указываем с большой буквы
    /// let choosenLinks - Переводим ссылки из ЮРЛ в Стринг
    /// cell.filterSwitch.isOn - тут мы загружаем данные (положение свича) из юзерДефолта
    ///
    /// cell.switchActionHandler - прописываем логику того, что будет происходит при включенном и
    /// выключенном свитче. Либо мы добавляем новый фильтр, либо убираем его. Все это автоматически
    /// сохранится в юзерДефолтс
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SettingsViewCell.cellIdentifer,
            for: indexPath) as? SettingsViewCell else { return UICollectionViewCell()}
        
        cell.titleLabel.text = links[indexPath.item].rawValue.capitalized
        let choosenLinks = links.compactMap({ $0.url.absoluteString })
        
        cell.filterSwitch.isOn = presenter?.loadPosition(key: indexPath.item) ?? false
        
        cell.switchActionHandler = { [weak self] isOn in
            if isOn {
                self?.workWithSwitch(choosenLinks: choosenLinks, indexPath: indexPath, position: true)
            } else {
                self?.workWithSwitch(choosenLinks: choosenLinks, indexPath: indexPath, position: false)
            }
        }
        return cell
    }
    
    /// Метод-сапорт. Реализована логика сохрания данных в юзерДефолтс для позиций Свитча (тру или фолс)
    
    private func workWithSwitch(choosenLinks: [String], indexPath: IndexPath, position: Bool) {
        if position {
            self.selectedFilters.append(choosenLinks[indexPath.item])
            self.presenter?.saveFilters(with: self.selectedFilters)
            self.presenter?.savePosition(key: indexPath.item, position: position)
        } else {
            self.selectedFilters = self.selectedFilters.filter { $0 != choosenLinks[indexPath.item]}
            self.presenter?.saveFilters(with: self.selectedFilters)
            self.presenter?.savePosition(key: indexPath.item, position: position)
        }
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
