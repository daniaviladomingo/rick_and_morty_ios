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
    
    init(persistenceContainer: NSPersistentContainer, mapper: CharacterDbMapper) {
        self.persistenceContainer = persistenceContainer
        self.mapper = mapper
    }
    
    func addCharacterToFavorite(character: Character) -> Completable {
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
            
            do {
                try self.persistenceContainer.viewContext.save()
                observer(.completed)
            } catch let error as NSError {
                observer(.error(error))
            }
            return Disposables.create()
        }
    }
    
    func getCharacterFavorite(id: Int) -> Single<Character> {
        return Single.create { observer in
            let request: NSFetchRequest<CharacterDb> = CharacterDb.fetchRequest()
            request.predicate = NSPredicate(format: "id = %i", id)
            
            do {
                let result = try self.persistenceContainer.viewContext.fetch(request)
                observer(.success(self.mapper.map(model: result[0])))
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
}
