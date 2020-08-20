//
//  AddCharacterToFavorite.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 08/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import RxSwift

class AddCharacterToFavoriteUseCase: CompletableUseCaseWithParameter {
    private let repository: IRepository
    private let locationSource: ILocationSource
    
    init(repository: IRepository, locationSource: ILocationSource) {
        self.repository = repository
        self.locationSource = locationSource
    }
    
    typealias E = Character
    
    func execute(parameter: Character) -> Completable {
        return locationSource.currentLocation().flatMapCompletable { location in
            self.repository.addCharacterToFavorite(character: parameter, location: location).do(onCompleted: {
                self.locationSource.addRegionListener(location: location, identifier: parameter.name)
            })
        }
    }
}
