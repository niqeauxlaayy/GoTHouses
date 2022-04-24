//
//  ContentView.swift
//  GoTHouses
//
//  Created by MacBook Pro on 22.04.22.
//

import SwiftUI


//MARK: - ContentView

struct ContentView<ViewModel: ContentViewModelRepresentable>: View {
    
    
    //MARK: - Properties
    
    @StateObject var viewModel: ViewModel
    
    
    //MARK: - Body
    
    var body: some View {
        self.content
            .navigationTitle(self.viewModel.viewTitle)
    }
}


//MARK: - Views

private extension ContentView {
    
    var content: some View {
        
        ContentStateView(source: self.viewModel) {
            "No houses found"
        } content: {
            
            List {
                
                ForEach(self.viewModel.houses) { house in
                    
                    NavigationLink {
                        DetailsView(viewModel: ViewModelFactory.makeDetailsViewModel(house: house))
                    } label: {
                        HouseView(name: house.name, region: house.region)
                    }
                    .onAppear {
                        self.viewModel.loadMoreHousesIfNeeded(appearedHouse: house)
                    }
                }
            }
        }

    }
}


//MARK: - PreviewProvider

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(viewModel: ViewModelFactory.makeContentViewModel())
    }
}
