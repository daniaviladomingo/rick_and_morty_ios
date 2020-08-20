//
//  RemoteImp.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 30/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import RxSwift
import Alamofire

class RemoteImp: IRemote {
    private let endPoint: String
    
    private let mapper: CharacterApiMapper
    
    private var page: Int = 1
    
    init(endPoint: String, mapper: CharacterApiMapper) {
        self.endPoint = endPoint
        self.mapper = mapper
    }
    
    func getCharacters() -> Single<Array<Character>> {
        return Single<Array<Character>>.create { observer in
            AF.request("\(self.endPoint)character/?page=\(self.page)").responseDecodable(of: CharactersResponse.self) { response in
                switch response.result {
                    case .success(let value):
                        if value.info.next != nil {
                            self.page+=1
                            observer(.success(value.results.map({self.mapper.map(model: $0)})))
                        }
                    break
                                        
                    case .failure(let error):
                        observer(.error(error))
                    break
                }
            }
            return Disposables.create()
        }
    }
    
    func getCharacter(id: Int) -> Single<Character> {
        return Single<Character>.create { observer in
            AF.request("\(self.endPoint)character/\(id)").responseDecodable(of: CharacterApi.self) { response in
                switch response.result {
                    case .success(let value):
                        observer(.success(self.mapper.map(model: value)))
                    break
                                        
                    case .failure(let error):
                        observer(.error(error))
                    break
                }
            }
            return Disposables.create()
        }
    }
}
