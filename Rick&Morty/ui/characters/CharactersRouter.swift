//
//  Route.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 31/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

class CharactersRouter: IRouterCharacters {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    static func createModule(navigationController: UINavigationController) -> UIViewController {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let getCharactersUseCase: GetCharactersUseCase = GetCharactersUseCase(repository: appDelegate.repository)
        
        let view: IViewCharacters = CharactersViewController()
        let router: IRouterCharacters = CharactersRouter(navigationController: navigationController)
        let presenter: IPresenterCharacters = CharactersPresenterImp(view: view, router: router, getCharactersUseCase: getCharactersUseCase)

        view.presenter = presenter
        
        navigationController.viewControllers = [view as! UIViewController]
        
        return navigationController
    }
    
    func navigateToCharacterDetail(id: Int) {
        let characterModule = CharacterRouter.createModule(navigationController: navigationController) as! CharacterViewController
        characterModule.id = id
        navigationController.pushViewController(characterModule, animated: true)
    }
}
