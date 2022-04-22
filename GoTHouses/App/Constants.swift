//
//  Constants.swift
//  GoTHouses
//
//  Created by MacBook Pro on 22.04.22.
//

import Foundation


//MARK: - Constants

enum Constants {
    
    
    //MARK: - API
    
    enum API {
        static let host = "anapioficeandfire.com"
        static let scheme = "https"
        
        enum Path {
            case characters(Int?)
            case houses(Int?)
        }
    }
}


//MARK: - Constants.API.Path

extension Constants.API.Path: CustomStringConvertible {
    
    var description: String {
        
        switch self {
            
        case .characters(.none):
            return "/api/characters"
            
        case let .characters(.some(id)):
            return "/api/characters/\(id)"
            
        case .houses(.none):
            return "/api/houses"
            
        case let .houses(.some(id)):
            return "/api/houses/\(id)"
        }
    }
}
