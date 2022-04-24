//
//  GoTHousesApp.swift
//  GoTHouses
//
//  Created by MacBook Pro on 22.04.22.
//

import SwiftUI

@main
struct GoTHousesApp: App {
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView {
                ContentView(viewModel: ViewModelFactory.makeContentViewModel())
                    .navigationBarTitleDisplayMode(.inline)
            }
            .navigationViewStyle(.stack)
        }
    }
}
