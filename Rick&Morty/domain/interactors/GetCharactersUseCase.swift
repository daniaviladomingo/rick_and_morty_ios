//
//  GetCharactersUseCase.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 30/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import Foundation
import RxSwift

class GetCharactersUseCase: SingleUseCase {    
    private let repository: IRepository
    
    init(repository: IRepository) {
        self.repository = repository
    }
    
    typealias T = Array<Character>
    
    func execute() -> Single<Array<Character>> {
        return repository.getCharacters()
    }    
}
