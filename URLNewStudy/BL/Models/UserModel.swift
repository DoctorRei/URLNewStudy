//
//  UserModel.swift
//  URLNewStudy
//
//  Created by Акира on 06.01.2024.
//

import Foundation

struct User {
    let login: String
    let password: String
    let person: Person
}

struct Person {
    let name: String
    let age: Int
    let sex: String
}
