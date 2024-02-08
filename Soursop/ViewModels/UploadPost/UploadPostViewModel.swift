//
//  UploadPostViewModel.swift
//  Nox
//
//  Created by KEEVIN MITCHELL on 9/20/22.
//

import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject {
    
    func uploadPost( caption: String, image: UIImage, completion: FirestoreCompletion) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        ImageUploader.uploadImage(image: image, type: .post) { imageUrl in
            let data = [ "caption" : caption,
                         "timestamp" : Timestamp(date: Date()),
                         "likes" : 0,
                         "imageUrl" : imageUrl,
                         "ownerUid" : user.id ?? "",
                         "ownerImageUrl" : user.profileImageUrl,
                         "ownerUsername" : user.username] as [String : Any ]
            // MARK: Completion handler for after upload stuff
                         COLLECTIONS_POSTS.addDocument(data: data, completion:  completion)
           
        }
    }
    
}
