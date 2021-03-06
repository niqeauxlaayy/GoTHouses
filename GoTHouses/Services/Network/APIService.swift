//
//  APIService.swift
//  GoTHouses
//
//  Created by MacBook Pro on 22.04.22.
//

import Combine
import Foundation
import Resolver


//MARK: - Protocols

protocol APIServiceRepresentable {
    
    func fetchCharacter(with id: Int) -> AnyPublisher<APICharacterModel, Error>
    func fetchHouse(with id: Int) -> AnyPublisher<APIHouseModel, Error>
    func fetchHouses(page: Int) -> AnyPublisher<[APIHouseModel], Error>
}


//MARK: - APIService

final class APIService {
    @Injected private var networkLayer: NetworkLayerRepresentable
}


//MARK: - APIServiceRepresentable

extension APIService: APIServiceRepresentable {
    
    func fetchCharacter(with id: Int) -> AnyPublisher<APICharacterModel, Error> {
        self.networkLayer.getObject(type: APICharacterModel.self, path: .characters(id), parameter: nil)
    }
    
    func fetchHouse(with id: Int) -> AnyPublisher<APIHouseModel, Error> {
        self.networkLayer.getObject(type: APIHouseModel.self, path: .houses(id), parameter: nil)
    }
    
    func fetchHouses(page: Int) -> AnyPublisher<[APIHouseModel], Error> {
        
        let parameter = [
            "page": String(page),
            "pageSize": Constants.API.pageSize
        ]
        
        return self.networkLayer.getObject(type: [APIHouseModel].self, path: .houses(nil), parameter: parameter)
    }
}
