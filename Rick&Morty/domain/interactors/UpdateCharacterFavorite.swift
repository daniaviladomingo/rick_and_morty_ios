//
//  UpdateCharacterFavorite.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 11/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import RxSwift

class UpdateCharacterFavorite: CompletableUseCaseWithParameter {
    
    private let repository: IRepository
    
    init(repository: IRepository) {
        self.repository = repository
    }
    
    typealias E = Character
    
    func execute(parameter: Character) -> Completable {
        return repository.updateCharacterFavorite(character: parameter)
    }
}
