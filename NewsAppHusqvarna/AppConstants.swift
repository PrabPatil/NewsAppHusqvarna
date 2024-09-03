//
//  AppConstants.swift
//  NewsAppHusqvarna
//
//  Created by Prabhu Patil.
//

import Foundation

struct AppConstants {
    
    static let everythingURL = "https://newsapi.org/v2/everything?"
    static let headlinesURL = "https://newsapi.org/v2/top-headlines?"
    
    // Keys
    static let apiKey = "395c65a6bd894f45bd8d1c0a346b0b8e"
    
    // Errors
    static let serverError = "A server error occured"
    
    // Others
    static let searchQueryMessage = "Type your query to search from NewsAPI"
    static let noSearchResults = "No search results found"
    
    // Images
    static let newsOptionsImage = "list.star"
    static let newsTabImage = "newspaper"
    static let searchTabImage = "magnifyingglass"
    static let savedTabImage = "bookmark"
}
