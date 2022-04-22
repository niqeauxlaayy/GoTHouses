//
//  MapperHelperConformable.swift
//  GoTHouses
//
//  Created by MacBook Pro on 22.04.22.
//

import Foundation


//MARK: - MapperHelperConformable

protocol MapperHelperConformable {
    func getID(from urlString: String?) -> Int
}

extension MapperHelperConformable {
    
    func getID(from urlString: String?) -> Int {
        Int((URL(string: urlString.orEmpty)?.lastPathComponent).orEmpty).orZero
    }
}
