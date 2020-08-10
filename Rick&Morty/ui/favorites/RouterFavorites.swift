//
//  FavoriteRouter.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 07/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

class RouterFavorites: IRouterFavorites {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    static func createModule() -> UIViewController {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let getCharacterFavoritesUseCase: GetCharacterFavoritesUseCase = GetCharacterFavoritesUseCase(repository: appDelegate.repository)
        
        let nvc: UINavigationController = UINavigationController()
        
        let view: IViewFavorites = ViewControllerFavorites()
        let router: IRouterFavorites = RouterFavorites(navigationController: nvc)
        let presenter: IPresenterFavorites = PresenterFavorites(view: view, router: router, getCharacterFavoritesUseCase: getCharacterFavoritesUseCase)
        
        view.presenter = presenter
        
        nvc.viewControllers = [view as! UIViewController]
        
        return nvc
    }
}
