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

        print("Pongo presenter 1")
        view.presenter = presenter
                
        print("Pongo presenter 2")
    
        
        print("\(view.presenter)")
        
//        view.presenter = nil
        
        return UINavigationController(rootViewController: view as! UIViewController)
    }
}
