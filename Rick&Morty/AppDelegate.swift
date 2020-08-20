//
//  AppDelegate.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 30/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    var remote: IRemote!
    var cache: ICache!
    
    var repository: IRepository!
    
    var locationSource: ILocationSource!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let charactersMapper: CharacterApiMapper = CharacterApiMapper()
        
        let charactersDbMapper: CharacterDbMapper = CharacterDbMapper()
        let locationDbMapper: LocationDbMapper = LocationDbMapper()
        
        remote = RemoteImp(endPoint: "https://rickandmortyapi.com/api/", mapper: charactersMapper)
        cache = CacheImp(persistenceContainer: persistentContainer, mapper: charactersDbMapper, locationMapper: locationDbMapper)
        
        repository = RepositoryImp(remote: remote, cache: cache)
        
        let notificationCenter = UNUserNotificationCenter.current()
        let notificationManager: INotificationManager = NotificationManagerImp(notificationCenter: notificationCenter)
        
        let locationManager = CLLocationManager()
        locationManager.desiredAccuracy = 100
        locationSource = LocationSourceImp(locationManager: locationManager, notificationManager: notificationManager, radius: Double(200))
        
        let charactersView = RouterCharacters.createModule()
        let favoriteView = RouterFavorites.createModule()
        
        let tabBarController = UITabBarController()
        
        charactersView.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        favoriteView.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        tabBarController.viewControllers = [charactersView, favoriteView]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        locationManager.requestAlwaysAuthorization()
        notificationCenter.requestAuthorization(options: [.alert, .sound]) {
            granted, error in
        }        

        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    //    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    //        // Called when a new scene session is being created.
    //        // Use this method to select a configuration to create the new scene with.
    //        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    //    }
    //
    //    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    //        // Called when the user discards a scene session.
    //        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    //        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    //    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Rick_Morty")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}


//extension AppDelegate: CLLocationManagerDelegate {
//  func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
//    // create CLLocation from the coordinates of CLVisit
//    let clLocation = CLLocation(latitude: visit.coordinate.latitude, longitude: visit.coordinate.longitude)
//
//    // Get location description
//  }
//
//  func newVisitReceived(_ visit: CLVisit, description: String) {
////    let location = Location(visit: visit, descriptionString: description)
//
//    // Save location to disk
//  }
//}
