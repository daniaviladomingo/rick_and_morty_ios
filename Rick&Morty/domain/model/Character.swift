//
//  Character.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 30/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

struct Character {
    let id: Int
    let name: String
    let image: String
    let status: Status
    let species: String
    let origin: String
}

enum Status: String {
    case ALIVE = "ALIVE"
    case DEAD = "DEAD"
    case UNKNOWN = "UNKNOWN"
}
