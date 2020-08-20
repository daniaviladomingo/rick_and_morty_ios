//
//  CharacterMapper.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 30/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import Foundation

struct CharacterApiMapper: Mapper {
    
    typealias IN = CharacterApi
    
    typealias OUT = Character
    
    func map(model: CharacterApi) -> Character {
        let status: Status = {
            switch model.status {
            case .alive:
                return Status.ALIVE
            case .dead:
                return Status.DEAD
            case .unknown:
                return Status.UNKNOWN
                
            }
        }()
        
        return Character(id: model.id, name: model.name, image: model.image, status: status, species: model.species, origin: model.origin.name )
    }
    
    func inverseMap(model: Character) -> CharacterApi {
        fatalError("This method must be overridden")
    }
}
