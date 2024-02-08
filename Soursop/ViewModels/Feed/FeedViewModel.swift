//
//  FeedViewModel.swift
//  Nox
//
//  Created by KEEVIN MITCHELL on 9/24/22.
//  MARK: THIS IS THE VIEWMODEL FOR THE PARENT VIEW NOT THE FEED CELL
// MARK: THE VIEWMODEL OWNS AND UPDATES THE MODEL

import SwiftUI

class FeedViewModel: ObservableObject {
    // MARK: VM OWNS AN INSTANCE OF THE MODEL MVVM - DATA SOURCE FOR NOTIFICATIONS ARRAY
    @Published var posts = [Post]()
    
    init() {
        fetchPosts()
        
    }
    
    // MARK: Get all posts from users that we are following
    func fetchPosts( ) {
//        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        COLLECTIONS_POSTS.getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
            // MARK: THE VIEWMODEL  UPDATES THE MODEL
            self.posts = documents.compactMap({ try? $0.data(as: Post.self)})
                
            }
        
    }
}
