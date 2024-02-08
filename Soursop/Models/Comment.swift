//
//  Comment.swift
//  Nox
//
//  Created by KEEVIN MITCHELL on 9/28/22.
//

//import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Comment: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let postOwnerUid: String
    let profileImageUrl: String
    let commentText: String
    let timestamp: Timestamp
    let uid: String
    
    
}
