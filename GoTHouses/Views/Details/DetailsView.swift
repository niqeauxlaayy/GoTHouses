//
//  DetailsView.swift
//  GoTHouses
//
//  Created by MacBook Pro on 23.04.22.
//

import SwiftUI


//MARK: - DetailsView

struct DetailsView<ViewModel: DetailsViewModelRepresentable>: View {
    
    
    //MARK: - Properties
    
    @StateObject var viewModel: ViewModel
    
    
    //MARK: - Body
    
    var body: some View {
        self.content
            .navigationTitle(self.viewModel.viewTitle)
    }
}


//MARK: - Views

private extension DetailsView {
    
    var content: some View {
        
        ContentStateView(source: self.viewModel) {
            "No details found"
        } content: {
            
            ScrollView {
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        
                        if let houseDetails = self.viewModel.houseDetails {
                            
                            ForEach(HouseDetailType.allCases, id: \.self) { type in
                                
                                if let houseDetail = houseDetails.ofType(type),
                                   !houseDetail.value.isEmpty {
                                    HouseDetailView(detail: houseDetail)
                                }
                            }
                        }
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}


//MARK: - PreviewProvider

struct DetailsView_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailsView(viewModel: ViewModelFactory.makeDetailsViewModel(house: HouseModel(
            id: 0,
            name: "",
            region: "",
            coatOfArms: "",
            words: "",
            titles: [],
            seats: [],
            currentLordID: 0,
            heirID: 0,
            overlordID: 0,
            founded: "",
            founderID: 0,
            diedOut: "",
            ancestralWeapons: [],
            cadetBrancheIDs: [],
            swornMemberIDs: []
        )))
    }
}
