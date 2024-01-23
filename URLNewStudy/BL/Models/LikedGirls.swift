//
//  ImagesForTabBar.swift
//  URLNewStudy
//
//  Created by Акира on 21.01.2024.
//

import Foundation
import UIKit

struct LikedGirls: Hashable {
    let image: String
    let name: String
    let description: String
}

struct GirlCollection: Hashable {
    let title: String
    let girls: [LikedGirls]
    
    static func generateCollections() -> [GirlCollection] {
        [
            GirlCollection(title: "First Image",
                           girls: [
                            LikedGirls(
                                image: "forXCode2",
                                name: "Test1",
                                description: "Test2"),
                            LikedGirls(
                                image: "forXCode2",
                                name: "Test2",
                                description: "Test 3")
                           ]
                          ),
            GirlCollection(title: "Second Image",
                           girls: [
                            LikedGirls(
                                image: "forXCode3",
                                name: "Test3",
                                description: "Test3"),
                            LikedGirls(
                                image: "forXCode4",
                                name: "Test4",
                                description: "Test 4")
                           ]
                          ),
            GirlCollection(title: "Third Image",
                           girls: [
                            LikedGirls(
                                image: "forXCode4",
                                name: "Test5",
                                description: "Test5"),
                            LikedGirls(
                                image: "forXCode5",
                                name: "Test6",
                                description: "Test 6")
                           ]
                          )
        ]
    }
}
