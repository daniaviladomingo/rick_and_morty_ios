//
//  Route.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 31/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import Foundation
import UIKit

class Router: IRoute {
    static func createModule() -> UIViewController {
        let charactersMapper: CharacterMapper = CharacterMapper()
        let remote: IRemote = RemoteImp(endPoint: "https://rickandmortyapi.com/api/", mapper: charactersMapper)
        let repository: IRepository = RepositoryImp(remote: remote)
        let getCharactersUseCase: GetCharactersUseCase = GetCharactersUseCase(repository: repository)
        
        let view: IView = ViewController()
        let presenter: IPresenter = PresenterImp(view: view, getCharactersUseCase: getCharactersUseCase)

        view.presenter = presenter
                
        let navigationController = UINavigationController()
        navigationController.viewControllers = [view as! UIViewController]
        
        return navigationController
    }
}
