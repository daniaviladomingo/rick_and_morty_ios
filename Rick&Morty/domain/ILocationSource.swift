//
//  ILocationSource.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 18/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import RxSwift

protocol ILocationSource {
    func currentLocation()-> Single<Location>
    func addRegionListener(location: Location, identifier: String)
    func removeRegionListener(identifier: String)
}
