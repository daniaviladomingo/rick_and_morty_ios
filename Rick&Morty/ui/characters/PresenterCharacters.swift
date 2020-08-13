//
//  Presenter.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 31/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import RxSwift

class PresenterCharacters: BasePresenter, IPresenterCharacters {    
    private let view: IViewCharacters & IBaseView
    private let router: IRouterCharacters

    private let getCharactersUseCase: GetCharactersUseCase
    
    init(view: IViewCharacters & IBaseView, router: IRouterCharacters, getCharactersUseCase: GetCharactersUseCase) {
        self.getCharactersUseCase = getCharactersUseCase
        self.router = router
        self.view = view
    }
    
    func loadCharacters() {
        getCharactersUseCase
            .execute()
            .subscribe(onSuccess: { characters in
                self.view.showCharacters(characters: characters)
            }){ error in
                self.view.showError(msg: error.localizedDescription)
        }.disposed(by: disposeBag)
    }
    
    func showCharacterDetail(id: Int) {
        router.navigateToCharacterDetail(id: id)
    }
}
