//
//  CharacterAnnotation.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 24/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import MapKit


class CharacterAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String){
        self.coordinate = coordinate
        self.title = title
    }
}
