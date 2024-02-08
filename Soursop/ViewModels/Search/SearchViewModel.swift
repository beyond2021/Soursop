//
//  SearchViewModel.swift
//  Nox
//
//  Created by KEEVIN MITCHELL on 9/15/22.
// DATASOURCE FOR PARENTVIEW(SEARCHVIEW) AND CHILDVIEW(USERLISTVIEW)
// https://medium.com/firebase-developers/swiftui-mapping-firestore-documents-using-swift-codable-589b6bfe462d

import SwiftUI

class SearchViewModel: ObservableObject {
    // MARK: VM sets the Datamodel object - USER
    @Published var users = [User]()
//    @Published var posts = [Post]()
    
    init() {
        // MARK: Calls the API Method when instantiated
        fetchUsers()
//        fetchPosts()
    }
    // MARK: Calls the API
    func fetchUsers() {
        COLLECTIONS_USERS.addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            // MARK: Method 1
//            documents.forEach { snap in
//                guard let user = try? snap.data(as: User.self) else { return }
//                self.users.append(user)
//            }
            // MARK: Refactor 1
            
//            self.users = documents.compactMap { queryDocumentSnapshot -> User? in
//                  return try? queryDocumentSnapshot.data(as: User.self)
//                }
            
            // MARK: Refactor 2, $0.data() rep each document
            self.users = documents.compactMap({ try? $0.data(as: User.self)})
//            print("DEBUG: Users : \(self.users)")
            
        }
        
    }
    
    // MARK: Filtering
    func filteredUsers(_ query: String) -> [User] {
        /// If any of my user's username or fullname contain query(text) return those users in the array
        let lowerCasedQuery = query.lowercased()
        return users.filter({ $0.fullname.lowercased().contains(lowerCasedQuery) || $0.username.lowercased().contains(lowerCasedQuery)})
    }
    // MARK: Fetching Post API call
//    func fetchPosts() {
//        COLLECTIONS_POSTS.addSnapshotListener { querySnapshot, error in
//            guard let documents = querySnapshot?.documents else {
//                print("DEBUG: No Posts from DB in SearchVM")
//                return
//            }
//            self.posts = documents.compactMap({ try? $0.data(as: Post.self)})
//            print("DEBUG: Posts : \(self.posts)")
//        }
//    }
}
