//
//  CharacterModelMapper.swift
//  GoTHouses
//
//  Created by MacBook Pro on 22.04.22.
//

import Foundation


//MARK: - Protocols

protocol CharacterModelMapperRepresentable {
    func map(_ apiModel: APICharacterModel, type: CharacterType) -> CharacterModel
}


//MARK: - CharacterModelMapper

final class CharacterModelMapper: MapperHelperConformable {}


//MARK: - CharacterModelMapperRepresentable

extension CharacterModelMapper: CharacterModelMapperRepresentable {
    
    func map(_ apiModel: APICharacterModel, type: CharacterType) -> CharacterModel {
        CharacterModel(
            id: self.getID(from: apiModel.url),
            name: apiModel.name.orEmpty,
            type: type
        )
    }
}
