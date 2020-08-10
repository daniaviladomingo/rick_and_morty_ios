//
//  CharacterPresenter.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 07/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

class PresenterCharacter: BasePresenter, IPresenterCharacter {
    
    private let view: IViewCharacter
    
    private let getCharacterUseCase: GetCharacterUseCase
    private let addCharacterToFavoriteUseCase: AddCharacterToFavoriteUseCase
    
    init(view: IViewCharacter, getCharacterUseCase: GetCharacterUseCase, addCharacterToFavoriteUseCase: AddCharacterToFavoriteUseCase) {
        self.view = view
        self.getCharacterUseCase = getCharacterUseCase
        self.addCharacterToFavoriteUseCase = addCharacterToFavoriteUseCase
    }
    
    func loadCharacter(id: Int) {
        getCharacterUseCase
            .execute(parameter: id)
            .subscribe(onSuccess: { character in
                self.view.showCharacter(character: character)
            }){ error in
                print("\(error)")
        }.disposed(by: disposeBag)
    }
    
    func addToFavorite(character: Character) {
        addCharacterToFavoriteUseCase
            .execute(parameter: character)
            .subscribe(onCompleted: {
                print("Añado")
            }){ error in
                print("\(error)")
        }.disposed(by: disposeBag)
    }
}
