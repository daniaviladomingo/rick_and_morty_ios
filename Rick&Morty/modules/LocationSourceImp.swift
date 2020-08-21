//
//  LocationSourceImp.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 18/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import CoreLocation
import RxSwift

class LocationSourceImp: NSObject, ILocationSource {
    private let locationManager: CLLocationManager
    private let notificationManager: INotificationManager
    private let radius: Double
    
    private var rxLocation: ((Location) -> Void)?
    private var rxLocationError: ((Error) -> Void)?
    
    private var rxEnterRegion: (CLRegion) -> Void
    private var rxExitRegion: (CLRegion) -> Void
        
    init(locationManager: CLLocationManager, notificationManager: INotificationManager, radius: Double) {
        self.locationManager = locationManager
        self.notificationManager = notificationManager
        self.radius = radius
        rxEnterRegion = { region in
            notificationManager.notify(title: "\(region.identifier)", msg: "You has Entered")
        }
        rxExitRegion = { region in
            notificationManager.notify(title: "\(region.identifier)", msg: "You has Exited")
        }
    }
    
    func currentLocation() -> Single<Location> {
        return Single<Location>.create { observer in
            self.rxLocation = { location in
                observer(.success(location))
            }

            self.rxLocationError = { error in
                observer(.error(error))
            }

            self.locationManager.requestLocation()

            return Disposables.create()
        }
    }
    
    func addRegionListener(location: Location, identifier: String) {
        let center = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        let region = CLCircularRegion(center: center, radius: radius, identifier: identifier)
        region.notifyOnExit = true
        region.notifyOnEntry = true
        locationManager.startMonitoring(for: region)
    }
    
    func removeRegionListener(identifier: String) {
        locationManager.monitoredRegions
            .filter { region in region.identifier == identifier}
            .forEach { region in locationManager.stopMonitoring(for: region)
        }
    }
}

extension LocationSourceImp : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let loc = locations[0]
        rxLocation?.self(Location(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude))
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        rxLocationError?.self(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Entro")
        rxEnterRegion.self(region)
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Salgo")
        rxExitRegion.self(region)
    }
}
