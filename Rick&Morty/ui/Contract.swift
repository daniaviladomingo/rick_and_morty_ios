//
//  Contract.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 31/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

protocol IPresenter: class {
    func loadCharacters()
}

protocol IView: class {
    var presenter: IPresenter? { get set }
    func showCharacters(characters: [Character])
}

protocol IRoute: class {
    static func createModule() -> UIViewController
}
