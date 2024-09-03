//
//  ArticleListView.swift
//  NewsAppHusqvarna
//
//  Created by Prabhu Patil.
//

import SwiftUI

struct ArticleListView: View {
    
    let articles: [Article]
    @State private var selectedArticle: Article?

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(articles) { article in
                        ArticleView(article: article)
                            .onTapGesture {
                                selectedArticle = article
                            }
                            .padding(.vertical, 8)
                    }
                }
                .padding(.horizontal, 0)
                .sheet(item: $selectedArticle) { article in
                    SafariView(url: article.articleURL)
                        .edgesIgnoringSafeArea(.bottom)
                }
            } 

        }
    }
    
    
    struct ArticleListView_Previews: PreviewProvider {
        
        @StateObject static var articleBookmarkVM = BookmarkViewModel.shared
        
        static var previews: some View {
            NavigationView {
                ArticleListView(articles: Article.previewData)
                    .environmentObject(articleBookmarkVM)
            }
        }
    }
    
}
