//
//  ContentStateView.swift
//  GoTHouses
//
//  Created by MacBook Pro on 24.04.22.
//

import SwiftUI


//MARK: - ContentStateView

struct ContentStateView<Source: ContentStateObject, Content: View>: View {
    
    
    //MARK: - Properties
    
    @ObservedObject private var source: Source
    
    private var content: Content
    private var emptyText: String
    
    
    //MARK: - Init
    
    init(source: Source, emptyText: () -> String, @ViewBuilder content: () -> Content) {
        
        self.source = source
        self.content = content()
        self.emptyText = emptyText()
    }
    
    
    //MARK: - Body
    
    var body: some View {
        
        switch source.state {
            
        case .empty:
            self.makeEmptyView()
            
        case let .failed(error):
            self.makeErrorView(error)
            
        case .idle:
            self.makeIdleView()
            
        case .loading:
            self.makeLoadingView()
            
        case .success:
            self.makeContentView()
        }
    }
}


//MARK: - Views

private extension ContentStateView {
    
    func makeEmptyView() -> some View {
        Text(self.emptyText)
    }
    
    func makeErrorView(_ error: Error) -> some View {
        Text(error.localizedDescription)
    }
    
    func makeIdleView() -> some View {
        VStack {}
    }
    
    func makeLoadingView() -> some View {
        ProgressView()
    }
    
    func makeContentView() -> some View {
        self.content
    }
}
