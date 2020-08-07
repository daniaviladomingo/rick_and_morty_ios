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
    
    static func createModule() -> UIViewController {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let getCharactersUseCase: GetCharactersUseCase = GetCharactersUseCase(repository: appDelegate.repository)
        
        let nvc: UINavigationController = UINavigationController()
        
        let view: IViewCharacters = CharactersViewController()
        let router: IRouterCharacters = CharactersRouter(navigationController: nvc)
        let presenter: IPresenterCharacters = CharactersPresenterImp(view: view, router: router, getCharactersUseCase: getCharactersUseCase)

        view.presenter = presenter
    
        nvc.viewControllers = [view as! UIViewController]
        
        return nvc
    }
    
    func navigateToCharacterDetail(id: Int) {
        let characterModule = CharacterRouter.createModule(navigationController: navigationController) as! CharacterViewController
        characterModule.id = id
        navigationController.pushViewController(characterModule, animated: true)
    }
}
