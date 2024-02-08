//
//  CommentsViewModel.swift
//  Nox
//
//  Created by KEEVIN MITCHELL on 9/28/22.
//

import SwiftUI
import Firebase

class CommentsViewModel: ObservableObject {
    // MARK: Data Source
    @Published var comments = [Comment]()
    
    private let post : Post
    
    init(post: Post) {
        self.post = post
        fetchComments()
    }
    
    // MARK: Upload Comments
    
    func uploadComments(commentText: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let postId = post.id else { return }
        let data: [String: Any] = ["username" : user.username,
                                   "profileImageUrl" : user.profileImageUrl,
                                   "uid" : user.id ?? "",
                                   "timestamp" : Timestamp(date: Date()),
                                   "postOwnerUid" : post.ownerUid,
                                   "commentText" : commentText]
        // MARK: update Post sub collection
        COLLECTIONS_POSTS.document(postId).collection("post-comments").addDocument(data: data) {  error in
            if let error = error {
                print("DEBUG: Upload Comment error ; \(error.localizedDescription)")
                return
            }
            // MARK: SEND NOTIFICATION FROM STATIC FUNC _ NO INITILIZATION NEEDED
            NotificationsViewModel
                .uploadNotification(toUID: self.post.ownerUid, type: .comment, post: self.post)
            
        }
        
        
    }
    
    
    // MARK: Fetch Comments
    func fetchComments() {
        // MARK: this is a realtime fetch
        guard let postId = post.id else { return }
        let query = COLLECTIONS_POSTS.document(postId)
            .collection("post-comments")
            .order(by: "timestamp", descending: true)
        query.addSnapshotListener { snapshot, _ in
            snapshot?.documentChanges.forEach({ change in
                if change.type == .added {
                    guard let comment = try? change.document.data(as: Comment.self) else { return }
                    self.comments.append(comment)
                }
            })
        }
        
    }
}
