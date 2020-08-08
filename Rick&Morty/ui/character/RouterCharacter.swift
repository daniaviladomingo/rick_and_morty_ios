//
//  CharacterRouter.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 07/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

class RouterCharacter: IRouterCharacter {
    static func createModule(navigationController: UINavigationController) -> UIViewController {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let getCharacterUseCase: GetCharacterUseCase = GetCharacterUseCase(repository: appDelegate.repository)
        
        let view: IViewCharacter = ViewControllerCharacter()
        let presenter: IPresenterCharacter = PresenterCharacter(view: view, getCharacterUseCase: getCharacterUseCase)

        view.presenter = presenter
        
        return view as! UIViewController
    }    
}
