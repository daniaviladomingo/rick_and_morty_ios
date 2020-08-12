//
//  ICache.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 08/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import RxSwift

protocol ICache {
    func addCharacterToFavorite(character: Character) -> Completable
    func removeCharacterFromFavorite(id: Int) -> Completable
    func updateCharacterFavorite(character: Character) -> Completable

    func getCharacterFavorite(id: Int) -> Single<Character>
    func getCharactersFavorites() -> Single<[Character]>
    func isCharacterFavorite(id: Int) -> Single<Bool>
}
