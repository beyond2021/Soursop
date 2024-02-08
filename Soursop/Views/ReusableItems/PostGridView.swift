//
//  PostGridView.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 6/25/22.
// MARK: REUSABLE in Search and Profile

import SwiftUI
import Kingfisher

struct PostGridView: View {
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    let config: PostGridConfig
    @ObservedObject var viewModel: PostGridViewModel // MARK: Its own View Model
    
    init(config: PostGridConfig) {
        self.config = config
        self.viewModel = PostGridViewModel(config: config)
    }
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(viewModel.posts) { post in
                NavigationLink(destination: FeedCell(viewModel: FeedCellViewModel(post:post))) {
                    KFImage(URL(string: post.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width)
                        .clipped()
                }
                
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
