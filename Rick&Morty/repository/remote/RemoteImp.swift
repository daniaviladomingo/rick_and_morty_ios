//
//  RemoteImp.swift
//  Rick&Morty
//
//  Created by Daniel Ávila Domingo on 30/07/2020.
//  Copyright © 2020 Daniel Ávila Domingo. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

class RemoteImp: IRemote {
    private let endPoint: String
    
    private let mapper: CharacterMapper
    
    init(endPoint: String, mapper: CharacterMapper) {
        self.endPoint = endPoint
    }
    
    func getCharacters() -> Single<Array<Character>> {
        return Single<Array<Character>>.create { observer in
            AF.request("\(self.endPoint)character/").responseDecodable(of: CharactersResponse.self) { response in
                switch response.result {
                    case .success(let value):
                        observer(.success(value.results.map({self.mapper.map(model: $0)})))
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
