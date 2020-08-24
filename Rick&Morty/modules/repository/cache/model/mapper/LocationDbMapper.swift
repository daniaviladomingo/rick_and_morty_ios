//
//  LocationDbMapper.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 19/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

class LocationDbMapper: Mapper {
    typealias IN = LocationDb
    
    typealias OUT = Location
    
    
    func map(model: LocationDb) -> Location {
        return Location(latitude: model.latitude, longitude: model.longitude)
    }
    
    func inverseMap(model: Location) -> LocationDb {
        let location = LocationDb()
        
        location.latitude = model.latitude
        location.longitude = model.longitude
        
        return location
    }
}
