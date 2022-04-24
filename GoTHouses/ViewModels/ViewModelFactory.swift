//
//  ViewModelFactory.swift
//  GoTHouses
//
//  Created by MacBook Pro on 24.04.22.
//

import Foundation


//MARK: - ViewModelFactory

enum ViewModelFactory {
    
    static func makeContentViewModel() -> ContentViewModel {
        ContentViewModel()
    }
    
    static func makeDetailsViewModel(house: HouseModel) -> DetailsViewModel {
        DetailsViewModel(house: house)
    }
}
