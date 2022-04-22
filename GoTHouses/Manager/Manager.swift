//
//  Manager.swift
//  GoTHouses
//
//  Created by MacBook Pro on 22.04.22.
//

import Combine
import Foundation
import Resolver


//MARK: - Protocols

protocol ManagerRepresentable {
    func fetchHouses(page: Int) -> AnyPublisher<[HouseModel], Error>
}


//MARK: - Manager

final class Manager {
    
    @Injected private var apiService: APIServiceRepresentable
    @Injected private var houseModelMapper: HouseModelMapperRepresentable
}


//MARK: - ManagerRepresentable

extension Manager: ManagerRepresentable {
    
    func fetchHouses(page: Int) -> AnyPublisher<[HouseModel], Error> {
        self.apiService
            .fetchHouses(page: page)
            .map { $0.map(self.houseModelMapper.map) }
            .eraseToAnyPublisher()
    }
}
