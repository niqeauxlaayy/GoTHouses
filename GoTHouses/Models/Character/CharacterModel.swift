//
//  CharacterModel.swift
//  GoTHouses
//
//  Created by MacBook Pro on 22.04.22.
//

import Foundation


//MARK: - CharacterModel

struct CharacterModel: Identifiable, Equatable {
    let id: Int
    let name: String
    let type: CharacterType
}
