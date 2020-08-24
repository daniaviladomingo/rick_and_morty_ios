//
//  PresenterMap.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 24/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

class PresenterMap: BasePresenter, IPresenterMap {
    private let view: IViewMap & IBaseView
    
    private let getCharacterFavoriteUseCase: GetCharacterFavoriteUseCase
    
    init(
        view: IViewMap & IBaseView,
        getCharacterFavoriteUseCase: GetCharacterFavoriteUseCase) {
        self.view = view
        self.getCharacterFavoriteUseCase = getCharacterFavoriteUseCase
    }
    
    func loadCharacter(id: Int) {
        getCharacterFavoriteUseCase
            .execute(parameter: id)
            .subscribe(onSuccess: { pair in
                self.view.locate(character: pair.0, location: pair.1)
            }){ error in
                self.view.showError(msg: error.localizedDescription)
        }.disposed(by: disposeBag)
    }
}
