//
//  Mappers+Injection.swift
//  GoTHouses
//
//  Created by MacBook Pro on 22.04.22.
//

import Resolver

extension Resolver {
    
    static func registerMappers() {
        self.register { HouseModelMapper() }.implements(HouseModelMapperRepresentable.self)
    }
}
