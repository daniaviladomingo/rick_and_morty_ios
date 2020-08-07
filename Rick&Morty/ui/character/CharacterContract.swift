//
//  CharacterContract.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 07/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

protocol IRouterCharacter: class {
    static func createModule(navigationController: UINavigationController) -> UIViewController
}
