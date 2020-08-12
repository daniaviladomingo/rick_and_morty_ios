//
//  ContractFavorite.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 10/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

protocol IPresenterEditFavorite: class {
    func loadCharacter(id: Int)
    func removeFromFavorite(id: Int)
    func updateCharacter(character: Character)
}

protocol IViewEditFavorite: class {
    var presenter: IPresenterEditFavorite? { get set }
    func showFavorite(character: Character)
}

protocol IRouterEditFavorite: class {
    static func createModule(id: Int) -> UIViewController
}
