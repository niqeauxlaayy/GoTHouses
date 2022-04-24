//
//  HouseDetailsModel.swift
//  GoTHouses
//
//  Created by MacBook Pro on 22.04.22.
//

import Foundation


//MARK: - HouseDetailsModel

struct HouseDetailsModel: Identifiable {
    let id: Int
    let name: HouseDetailModel
    let region: HouseDetailModel
    let coatOfArms: HouseDetailModel
    let words: HouseDetailModel
    let titles: HouseDetailModel
    let seats: HouseDetailModel
    let currentLord: HouseDetailModel
    let heir: HouseDetailModel
    let overlord: HouseDetailModel
    let founded: HouseDetailModel
    let founder: HouseDetailModel
    let diedOut: HouseDetailModel
    let ancestralWeapons: HouseDetailModel
    let cadetBranches: HouseDetailModel
    let swornMembers: HouseDetailModel
}


extension HouseDetailsModel {
    
    func ofType(_ type: HouseDetailType) -> HouseDetailModel {
        
        switch type {
            
        case .name:
            return self.name
            
        case .region:
            return self.region
            
        case .coatOfArms:
            return self.coatOfArms
            
        case .words:
            return self.words
            
        case .titles:
            return self.titles
            
        case .seats:
            return self.seats
            
        case .currentLord:
            return self.currentLord
            
        case .heir:
            return self.heir
            
        case .overlord:
            return self.overlord
            
        case .founded:
            return self.founded
            
        case .founder:
            return self.founder
            
        case .diedOut:
            return self.diedOut
            
        case .ancestralWeapons:
            return self.ancestralWeapons
            
        case .cadetBranches:
            return self.cadetBranches
            
        case .swornMembers:
            return self.swornMembers
        }
    }
}
