//
//  File.swift
//  URLNewStudy
//
//  Created by Акира on 24.01.2024.
//

import UIKit
import CoreData

protocol StorageManagerProtocole {
    func createImage(url: String)
    func fetchImages() -> [Girl]
    func deleteAllImages()
    func deleteImage(with index: Int)
}

//MARK: - CRUD

final class StorageManager: StorageManagerProtocole {
    static var shared = StorageManager()
    private let context: NSManagedObjectContext
    
    private let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Girl")
        container.loadPersistentStores { _, error in
            if let error = error as? NSError {
                fatalError(error.localizedDescription)
            }
        }
        return container
    }()
    
    private init () {
        context = persistentContainer.viewContext
    }
    
    /// Сохраняем изменени в кор дате
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let error = error as NSError
                fatalError(error.localizedDescription)
            }
        }
    }
    
    /// Записываем в кор дату конкретную юрлу, которую решил пользователь сохранить
    
    func createImage(url: String) {
        guard let imageDescription = NSEntityDescription.entity(forEntityName: "Girl", in: context) else { return }
        let image = Girl(entity: imageDescription, insertInto: context)
        
        image.url = url
        
        saveContext()
    }
    
    /// Получаем весь список сохраненных ссылок на изображения из кордаты
    
    func fetchImages() -> [Girl] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Girl")
        do {
            return (try? context.fetch(fetchRequest) as? [Girl]) ?? []
        }
    }
    
    /// Удалить все ссылки на изображения из КорДата
    
    func deleteAllImages() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Girl")
        do {
            let images = try? context.fetch(fetchRequest) as? [Girl]
            images?.forEach{ context.delete($0) }
        }
        saveContext()
    }
    
    /// Удаляем один конкреный элемент из кор даты по индексу
    
    func deleteImage(with index: Int) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Girl")
        do {
            let images = try? context.fetch(fetchRequest) as? [Girl]
            guard let image = images?[index] else { return }
            context.delete(image)
        }
        saveContext()
    }
}
