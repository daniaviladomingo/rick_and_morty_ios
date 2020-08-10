//
//  RepositoryImp.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 30/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import Foundation
import RxSwift

class RepositoryImp: IRepository {
    private let remote: IRemote
    private let cache: ICache
    
    init(remote: IRemote, cache: ICache) {
        self.remote = remote
        self.cache = cache
    }
    
    func getCharacters() -> Single<Array<Character>> {
        return remote.getCharacters()
    }
    
    func getCharacter(id: Int) -> Single<Character> {
        return remote.getCharacter(id: id)
    }
    
    func addCharacterToFavorite(character: Character) -> Completable {
        return cache.addCharacterToFavorite(character: character)
    }
    
    func getCharacterFavorite(id: Int) -> Single<Character> {
        return cache.getCharacterFavorite(id: id)
    }
    
    func getCharactersFavorites() -> Single<[Character]> {
        return cache.getCharactersFavorites()
    }
    
    func isCharacterFavorite(id: Int) -> Single<Bool> {
        return cache.isCharacterFavorite(id: id)
    }    
}
