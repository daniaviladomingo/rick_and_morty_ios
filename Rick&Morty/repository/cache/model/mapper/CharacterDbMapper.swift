//
//  CharacterDbMapper.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 10/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import Foundation

struct CharacterDbMapper: Mapper {
    typealias IN = CharacterDb
    
    typealias OUT = Character
    
    func map(model: CharacterDb) -> Character {
        let status: Status = {
            switch model.status {
            case "Alive":
                return Status.ALIVE
            case "Dead":
                return Status.DEAD
            case "unknown":
                return Status.UNKNOWN
            case .none:
                return Status.UNKNOWN
            case .some(_):
                return Status.UNKNOWN
            }
        }()
                
        return Character(id: Int(model.id), name: model.name!, image: model.image!, status: status, species: model.species!, origin: model.origin!)
    }
    
    func inverseMap(model: Character) -> CharacterDb {
        let cDb = CharacterDb()
        
        let status: String = {
            switch model.status {
            case Status.ALIVE:
                return "Alive"
            case Status.DEAD:
                return "Dead"
            case Status.UNKNOWN:
                return "unknown"
            }
        }()
        
        cDb.id = Int16(model.id)
        cDb.image = model.image
        cDb.name = model.name
        cDb.species = model.species
        cDb.origin = model.origin
        cDb.status = status
        
        return cDb
    }
}
