//
//  ImageUploader.swift
//  Nox
//
//  Created by KEEVIN MITCHELL on 7/18/22.
//

import UIKit
import Firebase
import FirebaseStorage

enum UploadType {
    case profile
    case post
    var filePath: StorageReference {
        let filename = NSUUID().uuidString
        switch self {
        case.profile:
            return Storage.storage().reference(withPath: "/profile_images/\(filename)")
        case .post :
            return Storage.storage().reference(withPath: "/post_images/\(filename)")
            
        }
        
    }
}

struct ImageUploader {
    static func uploadImage(image: UIImage, type: UploadType, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let filename = NSUUID().uuidString
        let ref = type.filePath
        /// upload
        ref.putData(imageData) { _, error in
            ///handle the error
            if let error = error {
                print("DEBUG: failed to upload profile image \(error.localizedDescription)")
                return
            }
            
            print("DEBUG: Successfully uploaded image")
            /// get the download URL
            ref.downloadURL { url, _ in
                guard let imageURL = url?.absoluteString else {return }
                completion(imageURL)
            }
        }
        
    }
}
