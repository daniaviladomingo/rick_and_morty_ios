//
//  CharacterRouter.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 07/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

class CharacterRouter: IRouterCharacter {
    static func createModule(navigationController: UINavigationController) -> UIViewController {
        let view: UIViewController = CharacterViewController()
        return view
    }    
}
