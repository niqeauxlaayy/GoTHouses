//
//  HouseModel.swift
//  GoTHouses
//
//  Created by MacBook Pro on 22.04.22.
//

import Foundation


//MARK: - HouseModel

struct HouseModel: Identifiable, Equatable {
    let id: Int
    let name: String
    let region: String
    let coatOfArms: String
    let words: String
    let titles: [String]
    let seats: [String]
    let currentLordID: Int
    let heirID: Int
    let overlordID: Int
    let founded: String
    let founderID: Int
    let diedOut: String
    let ancestralWeapons: [String]
    let cadetBrancheIDs: [Int]
    let swornMemberIDs: [Int]
}
