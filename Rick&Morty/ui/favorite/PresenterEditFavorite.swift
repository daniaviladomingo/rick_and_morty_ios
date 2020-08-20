//
//  PresenterEditFavorite.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 11/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

class PresenterEditFavorite: BasePresenter, IPresenterEditFavorite {
    private let view: IViewEditFavorite & IBaseView
    
    private let removeCharacterFromFavorite: RemoveCharacterFromFavorite
    private let updateCharacterFavorite: UpdateCharacterFavorite
    private let getCharacterFavoriteUseCase: GetCharacterFavoriteUseCase
    
    init(
        view: IViewEditFavorite & IBaseView,
        getCharacterFavoriteUseCase: GetCharacterFavoriteUseCase,
        removeCharacterFromFavorite: RemoveCharacterFromFavorite,
        updateCharacterFavorite: UpdateCharacterFavorite) {
        self.view = view
        self.getCharacterFavoriteUseCase = getCharacterFavoriteUseCase
        self.removeCharacterFromFavorite = removeCharacterFromFavorite
        self.updateCharacterFavorite = updateCharacterFavorite
    }
    
    func loadCharacter(id: Int) {
        getCharacterFavoriteUseCase
            .execute(parameter: id)
            .subscribe(onSuccess: { pair in
                self.view.showFavorite(character: pair.0)
                print("\(pair.1)")
            }){ error in
                self.view.showError(msg: error.localizedDescription)
        }.disposed(by: disposeBag)
    }
    
    func removeFromFavorite(id: Int) {
        removeCharacterFromFavorite
            .execute(parameter: id)
            .subscribe(onCompleted: {
                
            }){ error in
                self.view.showError(msg: error.localizedDescription)
        }.disposed(by: disposeBag)
    }
    
    func updateCharacter(character: Character) {
        updateCharacterFavorite
            .execute(parameter: character)
            .subscribe(onCompleted: {
                
            }){ error in
                self.view.showError(msg: error.localizedDescription)
        }.disposed(by: disposeBag)
    }
}
