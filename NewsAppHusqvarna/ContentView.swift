//
//  ContentView.swift
//  NewsAppHusqvarna
//
//  Created by Prabhu Patil.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        
        TabView {
            NewsTabView()
                .tabItem {
                    Label("News", systemImage: AppConstants.newsTabImage)
                }
            
            SearchTabView()
                .tabItem {
                    Label("Search", systemImage: AppConstants.searchTabImage)
                }
            
            BookmarkTabView()
                .tabItem {
                    Label("Bookmark", systemImage: AppConstants.savedTabImage)
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
