//
//  APICharacterModel.swift
//  GoTHouses
//
//  Created by MacBook Pro on 22.04.22.
//

import Foundation


//MARK: - APICharacterModel

struct APICharacterModel: Codable, Equatable {
    let url: String?
    let name: String?
    let gender: String?
    let culture: String?
    let born: String?
    let died: String?
    let titles: [String]?
    let aliases: [String]?
    let father: String?
    let mother: String?
    let spouse: String?
    let allegiances: [String]?
    let books: [String]?
    let tvSeries: [String]?
    let playedBy: [String]?
}
