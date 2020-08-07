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
    
    init(remote: IRemote) {
        self.remote = remote
    }
    
    func getCharacters() -> Single<Array<Character>> {
        return remote.getCharacters()
    }
    
    func getCharacter(id: Int) -> Single<Character> {
        return remote.getCharacter(id: id)
    }
}
