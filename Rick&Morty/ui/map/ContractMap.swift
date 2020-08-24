//
//  ContractMap.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 24/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit

protocol IPresenterMap: class {
    func loadCharacter(id: Int)
}

protocol IViewMap: class {
    var presenter: IPresenterMap? { get set }
    func locate(character: Character, location: Location)
}
