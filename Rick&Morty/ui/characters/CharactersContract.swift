//
//  Contract.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 31/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

protocol IPresenterCharacters: class {
    func loadCharacters()
    func showCharacterDetail(id: Int)
}

protocol IViewCharacters: class {
    var presenter: IPresenterCharacters? { get set }
    func showCharacters(characters: [Character])
}

protocol IRouterCharacters: class {
    static func createModule(navigationController: UINavigationController) -> UIViewController
    func navigateToCharacterDetail(id: Int)
}
