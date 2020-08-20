//
//  RouterEditFavorite.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 11/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

class RouterEditFavorite: IRouterEditFavorite {
    static func createModule(id: Int) -> UIViewController {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let removeCharacterFromFavorite: RemoveCharacterFromFavorite = RemoveCharacterFromFavorite(repository: appDelegate.repository, locationSource: appDelegate.locationSource)
        let updateCharacterFavorite: UpdateCharacterFavorite = UpdateCharacterFavorite(repository: appDelegate.repository)
        let getCharacterFavoriteUseCase: GetCharacterFavoriteUseCase = GetCharacterFavoriteUseCase(repository: appDelegate.repository)
        
        let nvc: UINavigationController = UINavigationController()
        
        let view: ViewControllerEditFavorite = ViewControllerEditFavorite()
        view.id = id
        let router: IRouterEditFavorite = RouterEditFavorite()
        let presenter: IPresenterEditFavorite = PresenterEditFavorite(view: view, getCharacterFavoriteUseCase: getCharacterFavoriteUseCase, removeCharacterFromFavorite: removeCharacterFromFavorite, updateCharacterFavorite: updateCharacterFavorite)
        
        view.presenter = presenter
        
        nvc.viewControllers = [view as UIViewController]
        
        return nvc
    }
}
