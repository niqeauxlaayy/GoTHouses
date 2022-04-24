//
//  HouseView.swift
//  GoTHouses
//
//  Created by MacBook Pro on 24.04.22.
//

import SwiftUI


//MARK: - HouseView

struct HouseView: View {
    
    
    //MARK: - Properties
    
    let name: String
    let region: String
    
    
    //MARK: - Body
    
    var body: some View {
        self.content
    }
}


//MARK: - Views

private extension HouseView {
    
    var content: some View {
        
        HStack {
            
            VStack(alignment: .leading, spacing: 4) {
                
                Text(self.name)
                    .bold()
                Text(self.region.uppercased())
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

//MARK: - PreviewProvider

struct HouseView_Previews: PreviewProvider {
    
    static var previews: some View {
        HouseView(name: "Name", region: "Region")
    }
}
