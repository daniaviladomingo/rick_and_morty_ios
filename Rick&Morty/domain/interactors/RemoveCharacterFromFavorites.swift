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
    
    init(repository: IRepository) {
        self.repository = repository
    }
    
    typealias E = Int
    
    func execute(parameter: Int) -> Completable {
        return repository.removeCharacterFromFavorite(id: parameter)
    }
}
