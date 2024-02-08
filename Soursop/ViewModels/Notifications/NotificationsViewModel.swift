//
//  NotificationsViewModel.swift
//  Nox
//
//  Created by KEEVIN MITCHELL on 10/1/22.
// MARK: THIS IS THE VIEWMODEL FOR THIS SCREEN NOT THE CELL!

import SwiftUI
import Firebase
class NotificationsViewModel: ObservableObject {
    // MARK: VM OWNS AN INSTANCE OF THE MODEL MVVM - DATA SOURCE [Notification] FOR NOTIFICATIONS ARRAY
    @Published var notifications = [Notification]()
    
    init() {
        fetchNotifications()
    }
    
    
    // MARK: fetch Notifications FROM NOTIFICATIONS VIEW
    func fetchNotifications() {
        guard let currentUserId = AuthViewModel.shared.userSession?.uid else { return }
        let query = COLLECTIONS_NOTIFICATIONS
            .document(currentUserId)
            .collection("user-notifications")
            .order(by: "timestamp", descending: true)
        query.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            // MARK: UPDATING DATASOURCE
            self.notifications = documents.compactMap({try? $0.data(as: Notification.self)})
            print(self.notifications)
//
            print("DEBUG: Notifications: \(self.notifications)")
        }
        
    }
    
    // MARK: Upload Notifications, Static so it can be accessed anywhere without recreating this viewmodel
     static func uploadNotification(toUID uid: String, type: NotificationType, post: Post? = nil ) {
        // MARK: Current user
        guard let currentUser = AuthViewModel.shared.currentUser else { return }
        guard let userId = currentUser.id else {return}
        
        var data: [String: Any] = [
            "timestamp": Timestamp(date: Date()),
            "username" : currentUser.username,
            "uid" : userId,
            "profileImageUrl" : currentUser.profileImageUrl,
            "type" : type.rawValue]
        
        // MARK: if a Post was sent in
        if let post = post, let id = post.id {
            data["postId"] = id
            
        }
        // MARK: Upload
        COLLECTIONS_NOTIFICATIONS
            .document(uid)
            .collection("user-notifications")
            .addDocument(data: data)
        
    }
}
