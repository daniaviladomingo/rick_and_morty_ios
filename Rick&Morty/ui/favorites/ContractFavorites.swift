//
//  FavoriteContract.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 07/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

protocol IPresenterFavorites: class {
    func loadFavorites()
    func editFavorite(id: Int)
}

protocol IViewFavorites: class {
    var presenter: IPresenterFavorites? { get set }
    func showFavorites(characters: [Character])
}

protocol IRouterFavorites: class {
    static func createModule() -> UIViewController
    func editFavorite(id: Int)
}
