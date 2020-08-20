//
//  CacheImp.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 10/08/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import CoreData
import RxSwift

class CacheImp: ICache {
       
    private let persistenceContainer: NSPersistentContainer
    private let mapper: CharacterDbMapper
    private let locationMapper: LocationDbMapper
    
    init(persistenceContainer: NSPersistentContainer, mapper: CharacterDbMapper, locationMapper: LocationDbMapper) {
        self.persistenceContainer = persistenceContainer
        self.mapper = mapper
        self.locationMapper = locationMapper
    }
    
    func addCharacterToFavorite(character: Character, location: Location?) -> Completable {
        return Completable.create { observer in
            let characterDb = CharacterDb(context: self.persistenceContainer.viewContext)
            
            let status: String = {
                switch character.status {
                case Status.ALIVE:
                    return "Alive"
                case Status.DEAD:
                    return "Dead"
                case Status.UNKNOWN:
                    return "unknown"
                }
            }()
            
            characterDb.id = Int16(character.id)
            characterDb.name = character.name
            characterDb.image = character.image
            characterDb.status = status
            characterDb.origin = character.origin
            characterDb.species = character.species
            
            if let l = location {
                let locationDb = LocationDb(context: self.persistenceContainer.viewContext)
                locationDb.latitude = l.latitude
                locationDb.longitude = l.longitude

                characterDb.location = locationDb
            }
                            
            do {
                try self.persistenceContainer.viewContext.save()
                observer(.completed)
            } catch let error as NSError {
                observer(.error(error))
            }
            return Disposables.create()
        }
    }
    
    func removeCharacterFromFavorite(id: Int) -> Completable {
        return Completable.create { observer in
            let request: NSFetchRequest<CharacterDb> = CharacterDb.fetchRequest()
            request.predicate = NSPredicate(format: "id = %d", id)
            
            do {
                let result = try self.persistenceContainer.viewContext.fetch(request)
                self.persistenceContainer.viewContext.delete(result[0].location!)
                self.persistenceContainer.viewContext.delete(result[0])                
                try self.persistenceContainer.viewContext.save()
                observer(.completed)
            } catch let error as NSError {
                observer(.error(error))
            }
            return Disposables.create()
        }
    }
    
    func updateCharacterFavorite(character: Character) -> Completable {
        return Completable.create { observer in
            let request: NSFetchRequest<CharacterDb> = CharacterDb.fetchRequest()
            request.predicate = NSPredicate(format: "id = %d", character.id)
            
            do {
                let result = try self.persistenceContainer.viewContext.fetch(request)
                let characterToUpdate: NSManagedObject = result[0]
                
                let status: String = {
                    switch character.status {
                    case Status.ALIVE:
                        return "Alive"
                    case Status.DEAD:
                        return "Dead"
                    case Status.UNKNOWN:
                        return "unknown"
                    }
                }()
                
                characterToUpdate.setValue(character.name, forKey: "name")
                characterToUpdate.setValue(character.origin, forKey: "origin")
                characterToUpdate.setValue(character.species, forKey: "species")
                characterToUpdate.setValue(status, forKey: "status")
                
                try self.persistenceContainer.viewContext.save()
                observer(.completed)
            } catch let error as NSError {
                observer(.error(error))
            }
            return Disposables.create()
        }
    }
    
    func getCharacterFavorite(id: Int) -> Single<(Character,Location)> {
        return Single.create { observer in
            let request: NSFetchRequest<CharacterDb> = CharacterDb.fetchRequest()
            request.predicate = NSPredicate(format: "id = %d", id)
            
            do {
                let result = try self.persistenceContainer.viewContext.fetch(request)
                let character = self.mapper.map(model: result[0])
                let location = self.locationMapper.map(model: result[0].location!)
                observer(.success((character, location)))
            } catch let error as NSError {
                observer(.error(error))
            }
            return Disposables.create()
        }
    }
    
    func getCharactersFavorites() -> Single<[Character]> {
        return Single.create { observer in
            let request: NSFetchRequest<CharacterDb> = CharacterDb.fetchRequest()
                        
            do {
                let result = try self.persistenceContainer.viewContext.fetch(request)
                observer(.success(result.map({self.mapper.map(model: $0)})))
            } catch let error as NSError {
                observer(.error(error))
            }
            return Disposables.create()
        }
    }
    
    func isCharacterFavorite(id: Int) -> Single<Bool> {
        return Single.create { observer in
            let request: NSFetchRequest<CharacterDb> = CharacterDb.fetchRequest()
            request.predicate = NSPredicate(format: "id = %d", id)
            
            do {
                let result = try self.persistenceContainer.viewContext.fetch(request)
                observer(.success(result.count > 0))
            } catch let error as NSError {
                observer(.error(error))
            }
            return Disposables.create()
        }
    }
}
