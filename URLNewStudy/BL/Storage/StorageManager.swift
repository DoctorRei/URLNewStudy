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
    
    func createImage(url: String) {
        guard let imageDescription = NSEntityDescription.entity(forEntityName: "Girl", in: context) else { return }
        let image = Girl(entity: imageDescription, insertInto: context)

        image.url = url
        
        saveContext()
    }
    
    func fetchImages() -> [Girl] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Girl")
        do {
            return (try? context.fetch(fetchRequest) as? [Girl]) ?? []
        }
    }

    func deleteAllImages() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Girl")
        do {
            let images = try? context.fetch(fetchRequest) as? [Girl]
            images?.forEach{ context.delete($0) }
        }
        saveContext()
        print("сработало")
    }
}
