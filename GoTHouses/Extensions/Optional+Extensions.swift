//
//  Optional+Extensions.swift
//  GoTHouses
//
//  Created by MacBook Pro on 22.04.22.
//

import Foundation

extension Optional {
    
    var isNil: Bool {
        self == nil
    }
    
    var isNotNil: Bool {
        self != nil
    }
}


//MARK: - Bool

extension Optional where Wrapped == Bool {
    
    var orFalse: Bool {
        self ?? false
    }
    
    var orTrue: Bool {
        self ?? true
    }
}


//MARK: - Collection

extension Optional where Wrapped: Collection {
    
    var orEmpty: Wrapped {
        
        guard let self = self else {
            return [] as! Wrapped
        }
        
        return self
    }
    
    var isNilOrEmpty: Bool {
        self?.isEmpty ?? true
    }
    
    var isNotNilOrEmpty: Bool {
        
        guard let self = self else {
            return false
        }
        
        return !self.isEmpty
    }
}


//MARK: - Int

extension Optional where Wrapped == Int {
    
    var orZero: Int {
        self ?? 0
    }
}


//MARK: - String

extension Optional where Wrapped == String {
    
    var orEmpty: String {
        self ?? ""
    }
    
    var isNilOrEmpty: Bool {
        self?.isEmpty ?? true
    }
    
    var isNotNilOrEmpty: Bool {
        
        guard let self = self else {
            return false
        }
        
        return !self.isEmpty
    }
}
