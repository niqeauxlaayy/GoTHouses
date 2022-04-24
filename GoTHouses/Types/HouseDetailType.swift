//
//  HouseDetailType.swift
//  GoTHouses
//
//  Created by MacBook Pro on 24.04.22.
//

import Foundation


//MARK: - HouseDetailType

enum HouseDetailType: String, CaseIterable {
    case name
    case region
    case coatOfArms
    case words
    case titles
    case seats
    case currentLord
    case heir
    case overlord
    case founded
    case founder
    case diedOut
    case ancestralWeapons
    case cadetBranches
    case swornMembers
}


extension HouseDetailType {
    
    var name: String {
        self.rawValue.camelCaseToCapitalizedWords()
    }
}


//MARK: - String

private extension String {
    
    func camelCaseToCapitalizedWords() -> String {
        
        self.unicodeScalars.dropFirst().reduce(String(prefix(1))) {
            CharacterSet.uppercaseLetters.contains($1) ? $0 + " " + String($1) : $0 + String($1)
        }
        .capitalized
    }
}
