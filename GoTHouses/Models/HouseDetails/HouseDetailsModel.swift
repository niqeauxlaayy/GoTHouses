//
//  HouseDetailsModel.swift
//  GoTHouses
//
//  Created by MacBook Pro on 22.04.22.
//

import Foundation


//MARK: - HouseDetailsModel

struct HouseDetailsModel: Identifiable, Equatable {
    let id: Int
    let name: String
    let region: String
    let coatOfArms: String
    let words: String
    let titles: [String]
    let seats: [String]
    let currentLord: String
    let heir: String
    let overlord: String
    let founded: String
    let founder: String
    let diedOut: String
    let ancestralWeapons: [String]
    let cadetBranches: [String]
    let swornMembers: [String]
}
