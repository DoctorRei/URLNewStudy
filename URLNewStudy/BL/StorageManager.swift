//
//  File.swift
//  URLNewStudy
//
//  Created by Акира on 24.01.2024.
//

import UIKit
import CoreData

//MARK: - CRUD

public final class StorageManager {
    public static let shared = StorageManager()
    private init() {}
    
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }
    
    public func createPicture(with url: String, picture: UIImage, and id: Int16) {
        guard let pictureGirlEntityDescription = NSEntityDescription.entity(
            forEntityName: "Girl",
            in: context
        ) else { return }
        
        let pictureGirl = GirlPicture(entity: pictureGirlEntityDescription, insertInto: context)
        
        pictureGirl.url = url
        pictureGirl.picture = picture
        pictureGirl.id = id
        
        appDelegate.saveContext()
    }
    
    public func fetchPictures() -> [GirlPicture] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Girl")
        do {
            return (try? context.fetch(fetchRequest) as? [GirlPicture]) ?? []
        }
    }
    
    public func fetchPicture(with id: Int16) -> GirlPicture? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Girl")
        do {
            let pictures = try? context.fetch(fetchRequest) as? [GirlPicture]
            return pictures?.first(where: { $0.id == id })
        }
    }
    
    public func updatePicture(with url: String, id: Int16) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Girl")
        do {
            guard let pictures = try? context.fetch(fetchRequest) as? [GirlPicture],
                  let picture = pictures.first(where: { $0.id == id }) else { return }
            picture.url = url
        }
        appDelegate.saveContext()
    }
    
    public func deleteAllPictures() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Girl")
        do {
            let pictures = try? context.fetch(fetchRequest) as? [GirlPicture]
            pictures?.forEach { context.delete($0) }
        }
    }
    
    public func deletePicture(with id: Int16) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Girl")
        do {
            guard let pictures = try? context.fetch(fetchRequest) as? [GirlPicture],
                  let picture = pictures.first(where: { $0.id == id }) else { return }
            context.delete(picture)
        }
    }
}
