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
    
    func fetchHouseDetails(for house: HouseModel) -> AnyPublisher<HouseDetailsModel, Error>
    func fetchHouses(page: Int) -> AnyPublisher<[HouseModel], Error>
}


//MARK: - Manager

final class Manager {
    
    @Injected private var apiService: APIServiceRepresentable
    @Injected private var characterModelMapper: CharacterModelMapperRepresentable
    @Injected private var houseDetailsModelMapper: HouseDetailsModelMapperRepresentable
    @Injected private var houseModelMapper: HouseModelMapperRepresentable
    
    private var cancellables = Set<AnyCancellable>()
}


//MARK: - ManagerRepresentable

extension Manager: ManagerRepresentable {
    
    func fetchHouseDetails(for house: HouseModel) -> AnyPublisher<HouseDetailsModel, Error> {
        
        let publisher = PassthroughSubject<HouseDetailsModel, Error>()
        
        let publishers = [
            self.fetchCharacter(with: house.currentLordID, type: .currentLord),
            self.fetchCharacter(with: house.heirID, type: .heir),
            self.fetchCharacter(with: house.overlordID, type: .overlord)
        ] +
        house.cadetBrancheIDs.map { self.fetchHouse(with: $0) } +
        house.swornMemberIDs.map { self.fetchCharacter(with: $0, type: .swornMember) }
        
        publishers.publisher.collect().sink { values in
            
            publisher.send(self.houseDetailsModelMapper.map(
                house,
                characters: values.compactMap { $0 as? CharacterModel },
                cadetBranches: values.compactMap { $0 as? HouseModel }
            ))
        }
        .store(in: &self.cancellables)
        
        return publisher.eraseToAnyPublisher()
    }
    
    func fetchHouses(page: Int) -> AnyPublisher<[HouseModel], Error> {
        self.apiService
            .fetchHouses(page: page)
            .map { $0.map(self.houseModelMapper.map) }
            .eraseToAnyPublisher()
    }
}


//MARK: - Helper

private extension Manager {
    
    func fetchCharacter(with id: Int, type: CharacterType) -> AnyPublisher<CharacterModel, Error> {
        self.apiService
            .fetchCharacter(with: id)
            .map { self.characterModelMapper.map($0, type: type) }
            .eraseToAnyPublisher()
    }
    
    func fetchHouse(with id: Int) -> AnyPublisher<HouseModel, Error> {
        self.apiService
            .fetchHouse(with: id)
            .map { self.houseModelMapper.map($0) }
            .eraseToAnyPublisher()
    }
}
