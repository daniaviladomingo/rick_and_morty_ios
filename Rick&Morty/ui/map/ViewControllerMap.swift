//
//  ViewControllerMap.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 24/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import MapKit
import UIKit

class ViewControllerMap: BaseView, IViewMap {
    var id: Int!
    
    var presenter: IPresenterMap?
    
    private let mapKit: MKMapView = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildUI()
        
        presenter?.loadCharacter(id: id)
    }
    
    func locate(character: Character, location: Location) {
        print("\(location)")
        let coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        
        let characterAnnotation = CharacterAnnotation(coordinate: coordinate, title: character.name)
        mapKit.addAnnotation(characterAnnotation)
        mapKit.setCenter(coordinate, animated: true)
    }
    
    private func buildUI() {
        view.backgroundColor = .white

        mapKit.translatesAutoresizingMaskIntoConstraints = false
        mapKit.isZoomEnabled = true
        mapKit.showsCompass = true
        
        view.addSubview(mapKit)
        
        NSLayoutConstraint.activate([
            mapKit.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapKit.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mapKit.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mapKit.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }

}
