//
//  ViewController.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 30/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let charactersMapper: CharacterMapper = CharacterMapper()
        let remote: IRemote = RemoteImp(endPoint: "https://rickandmortyapi.com/api/", mapper: charactersMapper)
        let repository: IRepository = RepositoryImp(remote: remote)
        let getCharactersUseCase: GetCharactersUseCase = GetCharactersUseCase(repository: repository)
            
        disposeBag.insert(
            getCharactersUseCase
                .execute()
                .subscribe(onSuccess: { characters in
                    characters.forEach { c in
                        print("\(c)")
                    }
                }){ error in
                    print("\(error)")
            }
        )
    }
}
