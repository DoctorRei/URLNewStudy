//
//  Girl+CoreDataProperties.swift
//  URLNewStudy
//
//  Created by Акира on 27.01.2024.
//
//

import Foundation
import CoreData
import UIKit

@objc(Girl)
public class Girl: NSManagedObject {

}

extension Girl {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Girl> {
        return NSFetchRequest<Girl>(entityName: "Girl")
    }

    @NSManaged public var url: String?
    @NSManaged public var image: Data?
    @NSManaged public var id: UUID?
}

extension Girl : Identifiable {

}
