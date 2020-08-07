//
//  FavoriteViewController.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 07/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

class ViewControllerFavorite: UIViewController {
    var id: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Rick & Morty"
            
        print("\(id)")
    }
}
