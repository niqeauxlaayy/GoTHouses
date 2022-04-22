//
//  NetworkLayer.swift
//  GoTHouses
//
//  Created by MacBook Pro on 22.04.22.
//

import Combine
import Foundation
import Resolver


//MARK: - Protocols

protocol NetworkLayerRepresentable {
    func getObject<T: Decodable>(type: T.Type, path: Constants.API.Path, parameter: [String: String]?) -> AnyPublisher<T, Error>
}


//MARK: - NetworkLayer

final class NetworkLayer {
    @Injected private var apiClient: APIClientRepresentable
}


//MARK: - NetworkLayerRepresentable

extension NetworkLayer: NetworkLayerRepresentable {
    
    func getObject<T: Decodable>(type: T.Type, path: Constants.API.Path, parameter: [String : String]?) -> AnyPublisher<T, Error> {
        
        self.apiClient
            .getURLComponents(path: path, parameter: parameter)
            .tryMap { element -> Data in
                
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200
                else {
                    throw URLError(.badServerResponse)
                }
                
                return element.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
