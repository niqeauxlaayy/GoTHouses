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
        
        self.buildAdditionalHouseDetailsPublishers(for: house)
            .sink { completion in
                publisher.send(completion: completion)
            } receiveValue: { characters, houses in
                
                publisher.send(
                    self.houseDetailsModelMapper.map(
                        house,
                        characters: characters,
                        cadetBranches: houses
                    )
                )
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
    
    typealias AdditionalHouseDetailsPublishers = Publishers.CombineLatest<CharacterPublishers, HousePublishers>
    typealias CharacterPublishers = Publishers.Collect<Publishers.MergeMany<AnyPublisher<CharacterModel, Error>>>
    typealias HousePublishers = Publishers.Collect<Publishers.MergeMany<AnyPublisher<HouseModel, Error>>>
    
    func buildAdditionalHouseDetailsPublishers(for house: HouseModel) -> AdditionalHouseDetailsPublishers {
        Publishers.CombineLatest(self.buildCharacterPublishers(for: house), self.buildHousePublishers(for: house))
    }
    
    func buildCharacterPublishers(for house: HouseModel) -> CharacterPublishers {
        
        var publishers = [AnyPublisher<CharacterModel, Error>]()
        
        if self.isValid(house.currentLordID) {
            publishers.append(self.fetchCharacter(with: house.currentLordID, type: .currentLord))
        }
        
        if self.isValid(house.heirID) {
            publishers.append(self.fetchCharacter(with: house.heirID, type: .heir))
        }
        
        if self.isValid(house.overlordID) {
            publishers.append(self.fetchCharacter(with: house.overlordID, type: .overlord))
        }
        
        if self.isValid(house.founderID) {
            publishers.append(self.fetchCharacter(with: house.founderID, type: .founder))
        }
        
        publishers.append(contentsOf: house.swornMemberIDs.filter { self.isValid($0) }.map { self.fetchCharacter(with: $0, type: .swornMember) })
        
        return Publishers.MergeMany(publishers).collect()
    }
    
    func buildHousePublishers(for house: HouseModel) -> HousePublishers {
        Publishers.MergeMany(house.cadetBrancheIDs.filter { self.isValid($0) }.map { self.fetchHouse(with: $0) }).collect()
    }
    
    func isValid(_ id: Int) -> Bool {
        id > 0
    }
    
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
