//
//  DetailsViewModel.swift
//  GoTHouses
//
//  Created by MacBook Pro on 23.04.22.
//

import Combine
import Foundation
import Resolver


//MARK: - Protocols

protocol DetailsViewModelRepresentable: ContentStateObject {
    
    var houseDetails: HouseDetailsModel? { get }
    var viewTitle: String { get }
}


//MARK: - DetailsViewModel

final class DetailsViewModel: DetailsViewModelRepresentable {
    
    
    //MARK: - Properties
    
    @Injected private var manager: ManagerRepresentable
    
    @Published var houseDetails: HouseDetailsModel?
    @Published var viewTitle: String = "Details"
    
    private(set) var state: ContentState = .idle
    private var cancellables = Set<AnyCancellable>()
    
    
    //MARK: - Init
    
    init(house: HouseModel) {
        self.loadHouseDetails(for: house)
    }
}


//MARK: - Helper

private extension DetailsViewModel {
    
    func loadHouseDetails(for house: HouseModel) {
        
        self.state = .loading
        self.manager.fetchHouseDetails(for: house)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                
                switch completion {
                    
                case let .failure(error):
                    self?.state = .failed(error)
                    
                case .finished:
                    break
                }
            } receiveValue: { [weak self] houseDetails in
                self?.handleResponse(houseDetails: houseDetails)
            }
            .store(in: &self.cancellables)
    }
    
    func handleResponse(houseDetails: HouseDetailsModel) {
        
        self.houseDetails = houseDetails
        self.state = .success
    }
}
