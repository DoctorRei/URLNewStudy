//
//  TestGirls.swift
//  URLNewStudy
//
//  Created by Акира on 23.01.2024.
//

import Foundation
import UIKit

struct Source {
    static func allPhotos() -> [GirlImages] {
        [
            .init(id: 1, imageName: "forXCode2"),
            .init(id: 2, imageName: "forXCode3"),
            .init(id: 3, imageName: "forXCode4"),
            .init(id: 4, imageName: "forXCode5"),
        ]
    }
    
    static func randomPhotos(with count: Int) -> [GirlImages] {
        return (0..<count).map { _ in
            allPhotos().randomElement()!
        }
    }
}

struct GirlImages {
    let id: Int
    let imageName: String
}

struct SectionGirl {
    let sectionName: String
    var photos: [GirlImages]
}


