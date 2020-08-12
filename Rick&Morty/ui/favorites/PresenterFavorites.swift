//
//  PresenterFavorites.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 10/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

class PresenterFavorites: BasePresenter, IPresenterFavorites {
    private let view: IViewFavorites
    private let router: IRouterFavorites
    
    private let getCharacterFavoritesUseCase: GetCharacterFavoritesUseCase
    
    init(view: IViewFavorites, router: IRouterFavorites, getCharacterFavoritesUseCase: GetCharacterFavoritesUseCase) {
        self.getCharacterFavoritesUseCase = getCharacterFavoritesUseCase
        self.router = router
        self.view = view
    }
    
    func loadFavorites() {
        getCharacterFavoritesUseCase
            .execute()
            .subscribe(onSuccess: { characters in
                self.view.showFavorites(characters: characters)
            }){ error in
                print("\(error)")
        }.disposed(by: disposeBag)
    }
    
    func editFavorite(id: Int) {
        router.editFavorite(id: id)
    }
}
