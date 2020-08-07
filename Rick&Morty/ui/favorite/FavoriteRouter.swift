//
//  FavoriteRouter.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 07/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

class FavoriteRouter: IRouterFavorite {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    static func createModule() -> UIViewController {
        let nvc: UINavigationController = UINavigationController()
        let view: FavoriteViewController = FavoriteViewController()
        nvc.viewControllers = [view as UIViewController]
        return nvc
    }
}
