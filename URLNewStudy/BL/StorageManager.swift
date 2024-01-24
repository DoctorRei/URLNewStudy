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
    
}
