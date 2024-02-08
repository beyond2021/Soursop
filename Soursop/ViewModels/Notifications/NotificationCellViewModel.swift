//
//  NotificationCellViewModel.swift
//  Nox
//
//  Created by KEEVIN MITCHELL on 10/1/22.
// MARK: NEEDED BRCAUSE OF THE MANY DIFFERENT ACTIONS DONE IN THE EACH CELL

import SwiftUI

class NotificationCellViewModel: ObservableObject {
    // MARK: VM OWNS AN INSTANCE OF THE MODEL MVVM
    @Published var notification: Notification
    
    
    
    
    init(notification: Notification) {
        self.notification = notification
        checkIfUserIsFollowed()
        fetchNotificationPost()
        // MARK: Unecessary API calls TODO
        fetchNotificationUser()
    }
    
    // MARK: Follow
    func follow() {
        UserService.follow(uid: notification.uid) { _ in
            // MARK: SEND NOTIFICATION FROM STATIC FUNC _ NO INITILIZATION NEEDED
            NotificationsViewModel.uploadNotification(toUID: self.notification.uid, type: .follow)
            // MARK: triggers UI update/ UPDATING THE MODEL
            self.notification.isFollowed = true
        }
        
    }
    
    // MARK: Follow
    func unFollow() {
        UserService.unFollow(uid: notification.uid) { _ in
            // MARK: triggers UI update/ UPDATING THE MODEL
            self.notification.isFollowed = false
        }
        
    }
    
    // MARK: UPDATING FRONT END TO MATCH BACKEND
    func checkIfUserIsFollowed() {
        guard notification.type == .follow else {return}
        UserService.checkIfUserIsFollowed(uid: notification.uid) { isFollowed in
            self.notification.isFollowed = isFollowed
        }
        
    }
    
    // MARK: CHECK IF A POST IS ASSOCIATED WITH A NOTIFICATION AND ASSIGNING IT
    
    func fetchNotificationPost() {
        // MARK: UNWRAP THE POSTID AND RETURN HERE IF A POST DOES NOT EXISTS
        guard let postId = notification.postId else {return}
        
        //MARK: database rech out
        COLLECTIONS_POSTS.document(postId)
            .getDocument { snapshot, _ in
                // MARK: updating model
                self.notification.post = try? snapshot?.data(as: Post.self)
            }
    }
    // MARK: Get user needed for cell navigation
    func fetchNotificationUser() {
        COLLECTIONS_USERS
            .document(notification.uid)
            .getDocument { snapshot, _ in
                self.notification.user = try? snapshot?.data(as: User.self)
                print("DEBUG: user is: \(self.notification.user?.username ?? "")")
            }
    }
}
