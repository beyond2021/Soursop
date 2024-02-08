//
//  User.swift
//  Nox
//
//  Created by KEEVIN MITCHELL on 9/15/22.
// MARK: DATA MODEL - OOP

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    // MARK: From firebase
    @DocumentID var id: String?
    // MARK: Whether one user follows another/ Ignored by the Decodable protocol - Client side
    var isFollowed: Bool? = false
    
    
    // MARK: Another way to decode without the Decodable protocol
//    init(dictionary: [String: Any]) {
//        self.username = dictionary["uaername"] as? String ?? ""
//        self.email = dictionary["email"] as? String ?? ""
//        // etc
//    }
    
    // MARK: Is user current user  in logic
    // MARK: Determines whether the user is the current user or not
    // By checking the id in the back end (AuthViewModel.shared.userSession?.uid)to the id in the front end(@DocumentID var id: String?)
    var isCurrentUser: Bool {
        return AuthViewModel.shared.userSession?.uid == id
    }
    
}
