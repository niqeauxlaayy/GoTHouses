//
//  APIClient.swift
//  GoTHouses
//
//  Created by MacBook Pro on 22.04.22.
//

import Combine
import Foundation


//MARK: - Protocols

protocol APIClientRepresentable {
    func getURLComponents(path: Constants.API.Path, parameter: [String: String]?) -> URLSession.DataTaskPublisher
}


//MARK: - APIClient

final class APIClient {}


//MARK: - APIClientRepresentable

extension APIClient: APIClientRepresentable {
    
    func getURLComponents(path: Constants.API.Path, parameter: [String : String]?) -> URLSession.DataTaskPublisher {
        
        var components = URLComponents()
        components.scheme = Constants.API.scheme
        components.host = Constants.API.host
        components.path = path.description
        components.queryItems = parameter?.map(URLQueryItem.init)
        
        let urlRequest = URLRequest(
            url: components.url!,
            cachePolicy: .returnCacheDataElseLoad
        )
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
    }
}
