//
//  HouseDetailsModelMapper.swift
//  GoTHouses
//
//  Created by MacBook Pro on 22.04.22.
//

import Foundation


//MARK: - Protocols

protocol HouseDetailsModelMapperRepresentable {
    func map(_ house: HouseModel, characters: [CharacterModel], cadetBranches: [HouseModel]) -> HouseDetailsModel
}


//MARK: - HouseDetailsModelMapper

final class HouseDetailsModelMapper {}


//MARK: - HouseDetailsModelMapperRepresentable

extension HouseDetailsModelMapper: HouseDetailsModelMapperRepresentable {
    
    func map(_ house: HouseModel, characters: [CharacterModel], cadetBranches: [HouseModel]) -> HouseDetailsModel {
        HouseDetailsModel(
            id: house.id,
            name: house.name,
            region: house.region,
            coatOfArms: house.coatOfArms,
            words: house.words,
            titles: house.titles,
            seats: house.seats,
            currentLord: characters.first { $0.type == .currentLord }.map { $0.name }.orEmpty,
            heir: characters.first { $0.type == .heir }.map { $0.name }.orEmpty,
            overlord: characters.first { $0.type == .overlord }.map { $0.name }.orEmpty,
            founded: house.founded,
            founder: house.founder,
            diedOut: house.diedOut,
            ancestralWeapons: house.ancestralWeapons,
            cadetBranches: cadetBranches.map { $0.name },
            swornMembers: characters.filter { $0.type == .swornMember }.map { $0.name }
        )
    }
}
