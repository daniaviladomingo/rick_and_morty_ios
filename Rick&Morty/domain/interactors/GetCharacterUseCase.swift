//
//  GetCharacterUseCase.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 07/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import RxSwift

class GetCharacterUseCase: SingleUseCaseWithParameter {
    private let repository: IRepository
    
    init(repository: IRepository) {
        self.repository = repository
    }
    
    typealias E = Int
    typealias T = Character
    
    func execute(parameter: Int) -> Single<Character> {
        return repository.getCharacter(id: parameter)
    }
}
