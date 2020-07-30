//
//  CharacterMapper.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 30/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import Foundation

struct CharacterMapper: Mapper {
    
    typealias IN = Result
    
    typealias OUT = Character
    
    func map(model: Result) -> Character {
        return Character(id: model.id, name: model.name, image: model.image)
    }
    
    func inverseMap(model: Character) -> Result {
        fatalError("This method must be overridden")
    }
}
