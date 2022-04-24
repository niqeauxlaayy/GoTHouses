//
//  ContentViewModel.swift
//  GoTHouses
//
//  Created by MacBook Pro on 23.04.22.
//

import Combine
import Foundation
import Resolver


//MARK: - Protocols

protocol ContentViewModelRepresentable: ContentStateObject {
    
    var houses: [HouseModel] { get }
    var viewTitle: String { get }
    
    func loadMoreHousesIfNeeded(appearedHouse: HouseModel)
}


//MARK: - ContentViewModel

final class ContentViewModel: ContentViewModelRepresentable {
    
    
    //MARK: - Properties
    
    @Injected private var manager: ManagerRepresentable
    
    @Published var houses: [HouseModel] = []
    @Published var viewTitle = "GoT Houses"
    
    private(set) var state: ContentState = .idle
    private var cancellables = Set<AnyCancellable>()
    private var pageToLoad = 1
    
    
    //MARK: - Init
    
    init() {
        self.loadHouses()
    }
    
    
    //MARK: - Public interface
    
    func loadMoreHousesIfNeeded(appearedHouse: HouseModel) {
        
        guard self.shouldLoadMoreHouses(appearedHouse: appearedHouse) else {
            return
        }
        
        self.loadHouses()
    }
}


//MARK: - Helper

private extension ContentViewModel {
    
    func loadHouses() {
        
        guard self.state != .loading else {
            return
        }
        
        self.state = .loading
        self.manager.fetchHouses(page: self.pageToLoad)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                
                switch completion {
                    
                case let .failure(error):
                    self?.state = .failed(error)
                    
                case .finished:
                    break
                }
            } receiveValue: { [weak self] houses in
                self?.handleResponse(houses: houses)
            }
            .store(in: &self.cancellables)
    }
    
    func shouldLoadMoreHouses(appearedHouse: HouseModel) -> Bool {
        self.houses.last == appearedHouse && self.state == .success
    }
    
    func handleResponse(houses: [HouseModel]) {
        
        self.houses.append(contentsOf: houses)
        self.state = houses.isEmpty ? self.pageToLoad == 1 ? .empty : .success : .success
        self.pageToLoad += 1
    }
}
