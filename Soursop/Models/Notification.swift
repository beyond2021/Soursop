//
//  Notification.swift
//  Nox
//
//  Created by KEEVIN MITCHELL on 10/1/22.
// DATAMODEL

import FirebaseFirestoreSwift
import Firebase

struct Notification: Identifiable, Decodable {
    @DocumentID var id: String?
    var postId: String? // could also be a follow notification
    let username: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let type: NotificationType
    let uid: String // user id of sender
    var isFollowed: Bool? = false
    var post: Post? // For notifications
    var user: User? // For notifications
}


// MARK: Int type Enum
enum NotificationType: Int, Decodable {
    case like // rawvalue 0 - int type enum
    case comment // rawvalue 1 - int type enum
    case follow // rawvalue 2 - int type enum
    var notificationMessage: String {
        switch self {
        case .like: return " liked one of your posts"
        case .comment: return  "  commented on one of you posts"
        case .follow: return " started following you"
        }
    }
}
