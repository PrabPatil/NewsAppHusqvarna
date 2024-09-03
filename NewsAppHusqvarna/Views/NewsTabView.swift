//
//  NewsTabView.swift
//  NewsAppHusqvarna
//
//  Created by Prabhu Patil.
//

import SwiftUI

struct NewsTabView: View {
    
    @StateObject var articleNewsVM = NewsViewModel()

    var body: some View {
        NavigationView {
            ArticleListView(articles: articles)
                .overlay(overlayView)
                .task(id: articleNewsVM.fetchTaskToken, loadTask)
                .refreshable(action: refreshTask)
                .navigationBarItems(trailing: menu)
                .navigationTitle(articleNewsVM.fetchTaskToken.category.text)
                .navigationBarTitleDisplayMode(.inline)

        }

    }
    
    @ViewBuilder
    private var overlayView: some View {
        
        switch articleNewsVM.phase {
        case .empty:
            ProgressView()
        case .success(let articles) where articles.isEmpty:
            EmptyPlaceholderView(text: "No Articles", image: nil)
        case .failure(let error):
            RetryView(text: error.localizedDescription, retryAction: refreshTask)
        default: EmptyView()
        }
    }
    
    private var articles: [Article] {
        if case let .success(articles) = articleNewsVM.phase {
            return articles
        } else {
            return []
        }
    }
    
    @Sendable
    private func loadTask() async {
        await articleNewsVM.loadArticles()
    }
    
    @Sendable
    private func refreshTask() {
        DispatchQueue.main.async {
            articleNewsVM.fetchTaskToken = FetchTaskToken(category: articleNewsVM.fetchTaskToken.category, token: Date())
        }
    }
    
    private var menu: some View {
        Menu {
            Picker("Category", selection: $articleNewsVM.fetchTaskToken.category) {
                ForEach(Category.allCases) {
                    Text($0.text).tag($0)
                }
            }
        } label: {
            Image(systemName: AppConstants.newsOptionsImage)
                .imageScale(.large)
        }
    }
}

struct NewsTabView_Previews: PreviewProvider {
    
    @StateObject static var articleBookmarkVM = BookmarkViewModel.shared

    
    static var previews: some View {
        NewsTabView(articleNewsVM: NewsViewModel(articles: Article.previewData))
            .environmentObject(articleBookmarkVM)
    }
}


