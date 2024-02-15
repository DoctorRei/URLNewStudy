//
//  SettingsWorker.swift
//  URLNewStudy
//
//  Created by Акира on 15.02.2024.
//

import UIKit
import CoreData

protocol SettingsWorkerProtocole {
    func clearImages()
}

class SettingsWorker {
    let storageManager: StorageManagerProtocole
    
    init(storageManager: StorageManagerProtocole) {
        self.storageManager = storageManager
    }
}

extension SettingsWorker: SettingsWorkerProtocole {
    func clearImages() {
        storageManager.deleteAllImages()
    }
}


