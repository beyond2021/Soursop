//
//  PostGridViewModel.swift
//  Nox
//
//  Created by KEEVIN MITCHELL on 9/25/22.
// MARK: REUSABLE VIEW MODEL

import SwiftUI

// MARK: Enum with cases needed. More sases can be added Like saved Posts and Hastags
// Scalabilty Friendly
enum PostGridConfig {
    // MARK: Explore
    case explore
    //
    case profile(String)
//    case saved
//    case hastag
}

class PostGridViewModel: ObservableObject {
    @Published var posts = [Post]()
    //  MARK: Storage for config passes in
    let config: PostGridConfig
    
    // MARK: Initializing Config Enum
    init(config: PostGridConfig) {
        self.config = config
        // MARK: API call depending on Config
        fetchPosts(forConfig:  config)
    }
    
    func fetchPosts(forConfig config: PostGridConfig) {
        switch config {
        case .explore:
            fetchExplorPagePosts()
        case .profile(let uid):
            fetchUserPosts(forUid: uid)
        }
    }
    
    // MARK: Explore API function
    func fetchExplorPagePosts() {
        COLLECTIONS_POSTS.addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("DEBUG: No Posts from DB in SearchVM")
                return
            }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self)})
            print("DEBUG: Posts  API call")
        }
    }
    
    // MARK: Profile with UID API function
    func fetchUserPosts(forUid uid: String) {
        COLLECTIONS_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { querySnapshot, _ in
            guard let documents = querySnapshot?.documents else {
                print("DEBUG: No Posts from DB in SearchVM")
                return
            }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self)})

        }
        
    }
}


