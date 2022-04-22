//
//  HouseModelMapper.swift
//  GoTHouses
//
//  Created by MacBook Pro on 22.04.22.
//

import Foundation


//MARK: - Protocols

protocol HouseModelMapperRepresentable {
    func map(_ apiHouse: APIHouseModel) -> HouseModel
}


//MARK: - HouseModelMapper

final class HouseModelMapper: MapperHelperConformable {}


//MARK: - HouseModelMapperRepresentable

extension HouseModelMapper: HouseModelMapperRepresentable {
    
    func map(_ apiHouse: APIHouseModel) -> HouseModel {
        HouseModel(
            id: self.getID(from: apiHouse.url),
            name: apiHouse.name.orEmpty,
            region: apiHouse.region.orEmpty,
            coatOfArms: apiHouse.coatOfArms.orEmpty,
            words: apiHouse.words.orEmpty,
            titles: apiHouse.titles.orEmpty,
            seats: apiHouse.seats.orEmpty,
            currentLordID: self.getID(from: apiHouse.currentLord.orEmpty),
            heirID: self.getID(from: apiHouse.heir.orEmpty),
            overlordID: self.getID(from: apiHouse.overlord.orEmpty),
            founded: apiHouse.founded.orEmpty,
            founder: apiHouse.founder.orEmpty,
            diedOut: apiHouse.diedOut.orEmpty,
            ancestralWeapons: apiHouse.ancestralWeapons.orEmpty,
            cadetBrancheIDs: apiHouse.cadetBranches.orEmpty.map { self.getID(from: $0) },
            swornMemberIDs: apiHouse.swornMembers.orEmpty.map { self.getID(from: $0) }
        )
    }
}
