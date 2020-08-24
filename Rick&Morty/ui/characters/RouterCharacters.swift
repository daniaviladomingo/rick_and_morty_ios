//
//  Route.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 31/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

class RouterCharacters: IRouterCharacters {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    static func createModule() -> UIViewController {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let getCharactersUseCase: GetCharactersUseCase = GetCharactersUseCase(repository: appDelegate.repository)
        
        let nvc: UINavigationController = UINavigationController()
        
        let view: IViewCharacters & IBaseView & UIViewController = ViewControllerCharacters()
        let router: IRouterCharacters = RouterCharacters(navigationController: nvc)
        let presenter: IPresenterCharacters = PresenterCharacters(view: view, router: router, getCharactersUseCase: getCharactersUseCase)

        view.presenter = presenter
    
        nvc.viewControllers = [view]
        
        return nvc
    }
    
    func navigateToCharacterDetail(id: Int) {
        let characterModule = RouterCharacter.createModule(navigationController: navigationController) as! ViewControllerCharacter
        characterModule.id = id
        navigationController.pushViewController(characterModule, animated: true)
    }
}
