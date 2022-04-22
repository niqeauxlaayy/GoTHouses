//
//  Clients+Injection.swift
//  GoTHouses
//
//  Created by MacBook Pro on 22.04.22.
//

import Resolver

extension Resolver {
    
    static func registerClients() {
        self.register { APIClient() }.implements(APIClientRepresentable.self)
    }
}
