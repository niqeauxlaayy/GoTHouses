//
//  HouseModelMapper.swift
//  GoTHouses
//
//  Created by MacBook Pro on 22.04.22.
//

import Foundation


//MARK: - Protocols

protocol HouseModelMapperRepresentable {
    func map(_ apiHouse: APIHouseModel) -> HouseModel
}


//MARK: - HouseModelMapper

final class HouseModelMapper: HouseModelMapperRepresentable {
    
    func map(_ apiHouse: APIHouseModel) -> HouseModel {
        HouseModel()
    }
}
