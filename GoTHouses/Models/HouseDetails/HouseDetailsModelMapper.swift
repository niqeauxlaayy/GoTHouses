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
            name: HouseDetailModel(
                value: house.name,
                type: .name
            ),
            region: HouseDetailModel(
                value: house.region,
                type: .region
            ),
            coatOfArms: HouseDetailModel(
                value: house.coatOfArms,
                type: .coatOfArms
            ),
            words: HouseDetailModel(
                value: house.words,
                type: .words
            ),
            titles: HouseDetailModel(
                value: house.titles.joined(separator: ", "),
                type: .titles
            ),
            seats: HouseDetailModel(
                value: house.seats.joined(separator: ", "),
                type: .seats
            ),
            currentLord: HouseDetailModel(
                value: characters.first { $0.type == .currentLord }.map { $0.name }.orEmpty,
                type: .currentLord
            ),
            heir: HouseDetailModel(
                value: characters.first { $0.type == .heir }.map { $0.name }.orEmpty,
                type: .heir
            ),
            overlord: HouseDetailModel(
                value: characters.first { $0.type == .overlord }.map { $0.name }.orEmpty,
                type: .overlord
            ),
            founded: HouseDetailModel(
                value: house.founded,
                type: .founded
            ),
            founder: HouseDetailModel(
                value: characters.first { $0.type == .founder}.map { $0.name }.orEmpty,
                type: .founder
            ),
            diedOut: HouseDetailModel(
                value: house.diedOut,
                type: .diedOut
            ),
            ancestralWeapons: HouseDetailModel(
                value: house.ancestralWeapons.joined(separator: ", "),
                type: .ancestralWeapons
            ),
            cadetBranches: HouseDetailModel(
                value: cadetBranches.map { $0.name }.joined(separator: ", "),
                type: .cadetBranches
            ),
            swornMembers: HouseDetailModel(
                value: characters.filter { $0.type == .swornMember }.map { $0.name }.joined(separator: ", "),
                type: .swornMembers
            )
        )
    }
}
