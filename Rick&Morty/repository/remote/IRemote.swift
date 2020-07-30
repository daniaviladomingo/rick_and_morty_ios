//
//  IRemote.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 30/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import Foundation
import RxSwift

protocol IRemote {
    func getCharacters() -> Single<Array<Character>>
}
