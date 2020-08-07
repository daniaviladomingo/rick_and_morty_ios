//
//  CharacterViewControler.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 06/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    var id: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white        
            
        print("\(id)")
    }
}
