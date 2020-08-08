//
//  IRepository.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 30/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import RxSwift

protocol IRepository {
    func getCharacters() -> Single<Array<Character>>
    func getCharacter(id: Int) -> Single<Character>
}

