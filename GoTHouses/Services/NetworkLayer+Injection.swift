//
//  NetworkLayer+Injection.swift
//  GoTHouses
//
//  Created by MacBook Pro on 22.04.22.
//

import Resolver

extension Resolver {
    
    static func registerNetworkLayer() {
        self.register { NetworkLayer() }.implements(NetworkLayerRepresentable.self)
    }
}
