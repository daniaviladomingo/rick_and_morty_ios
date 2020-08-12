//
//  GetCharacterFavoriteUseCase.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 11/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import RxSwift

class GetCharacterFavoriteUseCase: SingleUseCaseWithParameter {
    private let repository: IRepository
    
    init(repository: IRepository) {
        self.repository = repository
    }
    
    typealias E = Int
    typealias T = Character
    
    func execute(parameter: Int) -> Single<Character> {
        return repository.getCharacterFavorite(id: parameter)
    }
}
