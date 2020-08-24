//
//  RouterMap.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 24/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

class RouteMap {
    static func createModule(id: Int) -> UIViewController {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let getCharacterFavoriteUseCase: GetCharacterFavoriteUseCase = GetCharacterFavoriteUseCase(repository: appDelegate.repository)
        
        let view: IViewMap & IBaseView & UIViewController = ViewControllerMap()
        (view as! ViewControllerMap).id = id
        
        let presenter: IPresenterMap = PresenterMap(view: view, getCharacterFavoriteUseCase: getCharacterFavoriteUseCase)
        
        view.presenter = presenter
                        
        return view
    }
}
