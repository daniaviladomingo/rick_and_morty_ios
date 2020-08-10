//
//  IsCharacterFavoriteUseCase.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 10/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import RxSwift

class IsCharacterFavoriteUseCase: SingleUseCaseWithParameter {
    
    private let repository: IRepository
    
    init(repository: IRepository) {
        self.repository = repository
    }
    typealias E = Int
    
    typealias T = Bool
    
    func execute(parameter: Int) -> Single<Bool> {
        return repository.isCharacterFavorite(id: parameter)
    }
}
