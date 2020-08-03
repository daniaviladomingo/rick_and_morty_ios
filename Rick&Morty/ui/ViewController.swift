//
//  ViewController.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 30/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, IView {
    var presenter: IPresenter?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Llamo presenter 1 \(presenter)")
        presenter?.loadCharacters()
        print("Llamo presenter 2")
    }
    
    func showCharacters(characters: Array<Character>) {
        characters.forEach { character in
            print("\(character)")
        }
    }
}
