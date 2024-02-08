//
//  Post.swift
//  Nox
//
//  Created by KEEVIN MITCHELL on 9/24/22.
//

import FirebaseFirestoreSwift // @DocumentID
import Firebase // Timestamp
import SwiftUI

struct Post: Identifiable, Decodable {
    let caption: String
    let imageUrl: String
    var likes: Int
    let ownerImageUrl: String
    let ownerUid: String
    let ownerUsername: String
    let timestamp: Timestamp
    @DocumentID var id: String?
    var didLike: Bool? = false
    var user: User?
}
