//
//  Managers+Injection.swift
//  GoTHouses
//
//  Created by MacBook Pro on 22.04.22.
//

import Resolver

extension Resolver {
    
    static func registerManagers() {
        self.register { Manager() }.implements(ManagerRepresentable.self)
    }
}
