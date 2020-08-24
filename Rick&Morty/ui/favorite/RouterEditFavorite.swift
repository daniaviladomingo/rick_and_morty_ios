//
//  RouterEditFavorite.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 11/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

class RouterEditFavorite: IRouterEditFavorite {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
        
    static func createModule(id: Int) -> UIViewController {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let removeCharacterFromFavorite: RemoveCharacterFromFavorite = RemoveCharacterFromFavorite(repository: appDelegate.repository, locationSource: appDelegate.locationSource)
        let updateCharacterFavorite: UpdateCharacterFavorite = UpdateCharacterFavorite(repository: appDelegate.repository)
        let getCharacterFavoriteUseCase: GetCharacterFavoriteUseCase = GetCharacterFavoriteUseCase(repository: appDelegate.repository)
        
        let nvc: UINavigationController = UINavigationController()
        
        let view: ViewControllerEditFavorite = ViewControllerEditFavorite()
        view.id = id
        let router: IRouterEditFavorite = RouterEditFavorite(navigationController: nvc)
        let presenter: IPresenterEditFavorite = PresenterEditFavorite(view: view, router: router, getCharacterFavoriteUseCase: getCharacterFavoriteUseCase, removeCharacterFromFavorite: removeCharacterFromFavorite, updateCharacterFavorite: updateCharacterFavorite)
        
        view.presenter = presenter
        
        nvc.viewControllers = [view as UIViewController]
        
        return nvc
    }
    
    func navigateToMap(id: Int) {
        let characterModule = RouteMap.createModule(id: id)
        navigationController.pushViewController(characterModule, animated: true)
    }
}
