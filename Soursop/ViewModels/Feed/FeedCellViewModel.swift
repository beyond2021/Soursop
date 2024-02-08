//
//  FeedCellViewModel.swift
//  Nox
//
//  Created by KEEVIN MITCHELL on 9/26/22.
//  MARK: THIS IS THE VIEWMODEL FOR THE CHILD VIEW NOT THE PARENT FEEDVIEW
// MARK: NEEDED BRCAUSE OF THE MANY DIFFERENT ACTIONS DONE IN THE FFED CELL
// MARK: functions here need to reach out to the backend
// MARK: THE VIEWMODEL OWNS AND UPDATES THE MODEL

import SwiftUI
import Firebase

class FeedCellViewModel: ObservableObject {
    // MARK: VM OWNS AN INSTANCE OF THE MODEL MVVM
    @Published var post: Post
    
    // MARK: COMPUTE LIKE/LIKES ISSUE
    var likeString: String {
        let label = post.likes == 1 ? "like" : "Likes"
        return "\(post.likes) \(label)"
    }
    
    
    init(post: Post) {
        self.post = post
        // MARK: AUTOMATIC TRIGGER
        checkIfUserLikedPost()
        fetchPostUser()
    }
    
    //MARK: Liking FROM FEED CELL
    func like() {
        // Current User.id. The current user is liking the post
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postID = post.id else { return }
        
        // MARK: Update the sub collection on the Post collection
        COLLECTIONS_POSTS.document(postID)
            .collection("post-likes")
            .document(uid).setData([:]) { _ in
                // MARK: Update the user-like structure
                COLLECTIONS_USERS.document(uid).collection("user-likes")
                    .document(postID)
                    .setData([:]) {  _ in
                        // MARK: Update like count backend
                        COLLECTIONS_POSTS.document(postID).updateData(["likes" : self.post.likes + 1])
                        // MARK: SEND NOTIFICATION FROM STATIC FUNC _ NO INITILIZATION NEEDED
                        NotificationsViewModel
                            .uploadNotification(toUID: self.post.ownerUid, type: .like, post: self.post)
                        // MARK: UPDATING THE MODEL
                        self.post.didLike = true
                        // MARK: Update like count frontend
                        self.post.likes += 1
                    }
                
            }
        
        // MARK: Update the sub collection on the User collection
        
    }
    
    // MARK: Unliking FROM FEED CELL
    func unLike() {
        guard post.likes > 0 else { return }
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postID = post.id else { return }
        COLLECTIONS_POSTS.document(postID)
            .collection("post-likes")
            .document(uid).delete { _ in
                COLLECTIONS_USERS.document(uid).collection("user-likes")
                    .document(postID).delete { _ in
                        COLLECTIONS_POSTS.document(postID).updateData(["likes" : self.post.likes - 1])
                        // MARK: UPDATING THE MODEL
                        self.post.didLike = false
                            self.post.likes -= 1
                    }
            }
        
    }
    
    // MARK: Check if post was liked
    
    func checkIfUserLikedPost() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postID = post.id else { return }
        // MARK: BACKEND CHECK
        COLLECTIONS_USERS.document(uid).collection("user-likes").document(postID).getDocument { snapshot, _ in
            guard let didLike = snapshot?.exists else { return }
            // MARK: BRING CLIENT IN SYNC
            self.post.didLike = didLike
        }
        
    }
    
    // MARK: Fetch User
    func fetchPostUser() {

        COLLECTIONS_USERS
            .document(post.ownerUid)
            .getDocument { snapshot, _ in
                self.post.user = try? snapshot?.data(as: User.self)
                print("DEBUG: user is: \(self.post.user?.username ?? "")")
            }
    }
    
}
