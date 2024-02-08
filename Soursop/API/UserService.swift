//
//  UserService.swift
//  Nox
//
//  Created by KEEVIN MITCHELL on 9/18/22.
// MARK: NEED THROUGHOUT THE APP

import SwiftUI
import Firebase
typealias FirestoreCompletion = ((Error?) -> Void)?

struct UserService {
    
    // MARK: Follow API Call
    static func follow(uid: String, completion: FirestoreCompletion ) {
        // MARK: Current UID
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        // MARK: create the follow collection
        COLLECTIONS_FOLLOWING
            .document(currentUid)
            .collection("user-following")
            .document(uid).setData([:]) // MARK: Update the current user following list
        { error in
            if let error = error {
                print("DEBUG: error following user \(error.localizedDescription)")
                return
            }
            // MARK: Following Success
            // MARK: Update the followers collection
            COLLECTIONS_FOLLOWERS
                .document(uid)
                .collection("user-followers")
                .document(currentUid)
                .setData([:], completion: completion)
            
        }
        
    }
    
    // MARK: Unfollow API call
    static func unFollow(uid: String, completion: FirestoreCompletion) {
        // MARK: Current UID
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        COLLECTIONS_FOLLOWING
            .document(currentUid)
            .collection("user-following")
            .document(uid)
            .delete{ _ in
                COLLECTIONS_FOLLOWERS
                    .document(uid)
                    .collection("user-followers")
                    .document(currentUid)
                    .delete(completion: completion)
                // MARK: Firebase backend completion handler ( (Error)? -> Void?)
                
            }
        
    }
    
    // MARK: Follow/Unfollow persisistense/API call
    
    static func checkIfUserIsFollowed(uid: String, completion: @escaping(Bool) -> Void) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        COLLECTIONS_FOLLOWING
            .document(currentUid)
            .collection("user-following")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let isFollowed = snapshot?.exists else { return }
                completion(isFollowed)
            }
        
    }
    
}
