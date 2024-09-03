//
//  NewsAppHusqvarna.swift
//
//  Created by Prabhu Patil.
//

import SwiftUI

@main
struct NewsAppHusqvarna: App {
    
    @StateObject var articleBookmarkVM = BookmarkViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(articleBookmarkVM)
        }
    }
}
