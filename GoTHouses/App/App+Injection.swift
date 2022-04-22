//
//  App+Injection.swift
//  GoTHouses
//
//  Created by MacBook Pro on 22.04.22.
//

import Resolver


//MARK: - ResolverRegistering

extension Resolver: ResolverRegistering {
    
    static public func registerAllServices() {
        
        self.registerClients()
        self.registerNetworkLayer()
        self.registerManagers()
        self.registerMappers()
        self.registerServices()
    }
}
