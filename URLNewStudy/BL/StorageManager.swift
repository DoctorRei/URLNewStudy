//
//  File.swift
//  URLNewStudy
//
//  Created by Акира on 24.01.2024.
//

import UIKit
import CoreData

protocol StorageManagerProtocole {
    func createImage(with id: UUID, url: String, Image: Data)
    func fetchImages() -> [Girl]
    func fetchImage(id: UUID) -> Girl?
    func updateImage(id: UUID, url: String)
    func deleteAllImages()
    func deleteImage(id: UUID)
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
    
    func createImage(with id: UUID, url: String, Image: Data) {
        guard let imageDescription = NSEntityDescription.entity(forEntityName: "Girl", in: context) else { return }
        let image = Girl(entity: imageDescription, insertInto: context)
        
        image.id = id
        image.url = url
        image.image = Image
        
        saveContext()
    }
    
    func fetchImages() -> [Girl] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Girl")
        do {
            return (try? context.fetch(fetchRequest) as? [Girl]) ?? []
        }
    }
    
    func fetchImage(id: UUID) -> Girl? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Girl")
        do {
            let images = try? context.fetch(fetchRequest) as? [Girl]
            return images?.first(where: {$0.id == id})
        }
    }
    
    func updateImage(id: UUID, url: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Girl")
        do {
            guard let images = try? context.fetch(fetchRequest) as? [Girl],
                  let image = images.first(where: {$0.id == id}) else { return }
            image.url = url
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
    
    func deleteImage(id: UUID) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Girl")
        do {
            guard let images = try? context.fetch(fetchRequest) as? [Girl],
                  let image = images.first(where: { $0.id == id}) else { return }
            context.delete(image)
        }
        saveContext()
    }
    
    
    
}
