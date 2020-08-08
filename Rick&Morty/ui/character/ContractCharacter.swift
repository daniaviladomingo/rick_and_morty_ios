//
//  CharacterContract.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 07/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

protocol IPresenterCharacter: class {
    func loadCharacter(id: Int)
    func addToFavorite(character: Character)
}

protocol IViewCharacter: class {
    var presenter: IPresenterCharacter? { get set }
    func showCharacter(character: Character)
}

protocol IRouterCharacter: class {
    static func createModule(navigationController: UINavigationController) -> UIViewController
}
