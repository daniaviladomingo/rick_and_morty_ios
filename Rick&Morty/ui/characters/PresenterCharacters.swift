//
//  Presenter.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 31/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import RxSwift

class PresenterCharacters: IPresenterCharacters {
    private let disposeBag = DisposeBag()
    
    private let view: IViewCharacters
    private let router: IRouterCharacters

    private let getCharactersUseCase: GetCharactersUseCase
    
    init(view: IViewCharacters, router: IRouterCharacters, getCharactersUseCase: GetCharactersUseCase) {
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
                print("\(error)")
            }.disposed(by: disposeBag)
    }
    
    func showCharacterDetail(id: Int) {
        router.navigateToCharacterDetail(id: id)
    }
}
