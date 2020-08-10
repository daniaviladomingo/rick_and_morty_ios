//
//  IRepository.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 30/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import RxSwift

protocol IRepository {
    func getCharacters() -> Single<[Character]>
    func getCharacter(id: Int) -> Single<Character>
    
    func addCharacterToFavorite(character: Character) -> Completable
    func getCharacterFavorite(id: Int) -> Single<Character>
    func getCharactersFavorites() -> Single<[Character]>
    
    func isCharacterFavorite(id: Int) -> Single<Bool>
}

