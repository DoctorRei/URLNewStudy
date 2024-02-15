//
//  SelectedImagePresenter.swift
//  URLNewStudy
//
//  Created by Акира on 06.02.2024.
//

import UIKit

protocol SelectedImagePresenterProtocole {
    func render()
    func getImageUrl() -> String
    func setupLabel() -> String
    func changeIndex(with: WorkWithIndexes)
}

enum WorkWithIndexes {
    case minus
    case plus
    case delete
}

final class SelectedImagePresenter {
    weak var view: SelectedImageViewControllerProtocole?
    private var router: SelectedImageRouterProtocole
    private var storageManager: StorageManagerProtocole
    private var selectedImages: [String]
    private var selectedIndex: Int
    
    init(
        view: SelectedImageViewControllerProtocole,
        router: SelectedImageRouterProtocole,
        storageManager: StorageManagerProtocole,
        selectedImages: [String],
        selectedIndex: Int
    ) {
        self.view = view
        self.router = router
        self.storageManager = storageManager
        self.selectedImages = selectedImages
        self.selectedIndex = selectedIndex
    }
}

extension SelectedImagePresenter {
    func deleteImage(with index: Int) {
        storageManager.deleteImage(with: index)
    }
}

//MARK: - Work With Indexes
/// Достаем из массива юрлов нужный нам элемент и возвращаем его

extension SelectedImagePresenter {
    func getImageUrl() -> String {
        let image = selectedImages[selectedIndex]
        return image
    }
    
    /// Метод для работы с индексом. Минус, Плюс и Удалить.
    
    func changeIndex(with: WorkWithIndexes) {
        switch with {
        case .minus:
            selectedIndex = max(selectedIndex - 1, 0)
        case .plus:
            selectedIndex = min(selectedIndex + 1, selectedImages.count - 1)
        case .delete:
            selectedImages.remove(at: selectedIndex)
            deleteImage(with: selectedIndex)
            selectedIndex -= 1
        }
    }
}

//MARK: - Setup View

extension SelectedImagePresenter: SelectedImagePresenterProtocole {
    func render() {
    }
    
    func setupLabel() -> String {
        let text = String(
            format: "%ld / %ld",
            selectedIndex + 1,
            selectedImages.count)
        return text
    }
}
