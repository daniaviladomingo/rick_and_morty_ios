//
//  Presenter.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 31/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import Foundation
import RxSwift

class PresenterImp: IPresenter {
    private let disposeBag = DisposeBag()
    
    private let view: IView
    
    private let getCharactersUseCase: GetCharactersUseCase
    
    init(view: IView, getCharactersUseCase: GetCharactersUseCase) {
        self.getCharactersUseCase = getCharactersUseCase
        self.view = view
    }
    
    func loadCharacters() {
        print("loado caracteres")
        getCharactersUseCase
            .execute()
            .subscribe(onSuccess: { characters in
                self.view.showCharacters(characters: characters)
            }){ error in
                print("\(error)")
            }.disposed(by: disposeBag)
    }
}
