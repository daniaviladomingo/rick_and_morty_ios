//
//  Mapper.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 30/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

protocol Mapper {
    associatedtype IN
    associatedtype OUT
    
    func map(model: IN) -> OUT
    func inverseMap(model: OUT) -> IN
}

