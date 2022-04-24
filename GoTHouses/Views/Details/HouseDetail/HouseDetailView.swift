//
//  HouseDetailView.swift
//  GoTHouses
//
//  Created by MacBook Pro on 24.04.22.
//

import SwiftUI


//MARK: - HouseDetailView

struct HouseDetailView: View {
    
    
    //MARK: - Properties
    
    let detail: HouseDetailModel
    
    
    //MARK: - Body
    
    var body: some View {
        self.content
    }
}


//MARK: - Views

private extension HouseDetailView {
    
    var content: some View {
        
        HStack {
            
            VStack(alignment: .leading, spacing: 4) {
                
                Text(self.detail.type.name)
                    .bold()
                Text(self.detail.value)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.bottom)
            
            Spacer()
        }
    }
}


//MARK: - PreviewProvider

struct HouseDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        HouseDetailView(detail: HouseDetailModel(value: "Name", type: .name))
    }
}
