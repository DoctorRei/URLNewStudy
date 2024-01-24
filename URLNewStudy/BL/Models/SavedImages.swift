//
//  SavedImages.swift
//  URLNewStudy
//
//  Created by Акира on 24.01.2024.
//

import Foundation
import CoreData
import UIKit

@objc (GirlPicture)
public class GirlPicture: NSManagedObject {}

extension GirlPicture {
    @NSManaged public var url: String?
    @NSManaged public var image: [UIImage]
}

extension GirlPicture: Identifiable {
    
}
