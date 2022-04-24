//
//  ContentStateObject.swift
//  GoTHouses
//
//  Created by MacBook Pro on 24.04.22.
//

import Foundation


//MARK: - Protocols

protocol ContentStateObject: ObservableObject {
    var state: ContentState { get }
}


//MARK: - ContentState

enum ContentState {
    case empty
    case failed(Error)
    case idle
    case loading
    case success
}


//MARK: - Equatable

extension ContentState: Equatable {
    
    static func == (lhs: ContentState, rhs: ContentState) -> Bool {
        
        switch (lhs, rhs) {
            
        case (.empty, .empty):
            return true
        
        case let (.failed(a), .failed(b)):
            return a.localizedDescription == b.localizedDescription
            
        case (.idle, .idle):
            return true
            
        case (.loading, .loading):
            return true
            
        case (.success, .success):
            return true
            
        default:
            return false
        }
    }
}
