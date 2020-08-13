//
//  Status.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 29/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//
import Foundation

struct CharactersResponse: Codable {
    let info: Info
    let results: [CharacterApi]
}

struct Info: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}

struct CharacterApi: Codable {
    let id: Int
    let name: String
    let status: ApiStatus
    let species: String
    let type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown = "unknown"
}

struct Location: Codable {
    let name: String
    let url: String
}

enum ApiStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
