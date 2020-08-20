//
//  RemoveCharacterFromFavorites.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 11/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import RxSwift

class RemoveCharacterFromFavorite: CompletableUseCaseWithParameter {
    
    private let repository: IRepository
    private let locationSource: ILocationSource
    
    init(repository: IRepository, locationSource: ILocationSource) {
        self.repository = repository
        self.locationSource = locationSource
    }
    
    typealias E = Int
    
    func execute(parameter: Int) -> Completable {
        return repository.getCharacter(id: parameter).flatMapCompletable { character in
            self.repository.removeCharacterFromFavorite(id: parameter).do(onCompleted: {
                self.locationSource.removeRegionListener(identifier: character.name)
            })
        }
    }
}
