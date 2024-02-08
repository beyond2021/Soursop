//
//  AuthViewModel.swift
//  Nox
//
//  Created by KEEVIN MITCHELL on 7/13/22.
//

import SwiftUI
import Firebase
//import FirebaseAuth

class AuthViewModel: ObservableObject {
// MARK: Login state controllker - Front end
    @Published var userSession: Firebase.User?
    // MARK: Current User
    @Published var currentUser: User?

    
    
    ///Shared instance to access vm anywhere in App with shared
    ///static means it will only be created 1 time
    static let shared = AuthViewModel()
    
    
    init() {
        // MARK:  Backend  Login state controller
        userSession = Auth.auth().currentUser
        // MARK: called after usersession is set
        fetchUser()
    }
    
    
    // login
//    func login(withEmail email: String, password: String) {
//
//
//
//
//    }
    func login(withEmail email: String, password: String) {

        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG: login failed. \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            // MARK: Login / Logout bug fix
            self.fetchUser()
            
        }
      
        
    }
    
    // Register
    func register(withEmail email: String, password: String, image: UIImage?, fullname: String, username: String) {
        
        /// unwrap image coming in
        guard let image = image else { return }
      
        /// upload the image
        ImageUploader.uploadImage(image: image, type: .profile) { imageURL in
            // print("Register")
             Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                 if let error = error {
                     print(error.localizedDescription)
                     return
                 }
                 guard let user = authResult?.user else { return }
                 //self.userSession = user
                 print("DEBUG: Successfully registered user...")
                 // create a dictionary to upload to Firebase
                 let data = ["email": email,
                             "username": username,
                             "fullname": fullname,
                             "profileImageUrl": imageURL,
                             "uid": user.uid]
                 ///send it up
                 ///This is how we create a collection
                 ///Collection has [Documents]thas [string:string] BACKEND
                 COLLECTIONS_USERS.document(user.uid).setData(data) { _ in
                     print("DEBUG: Successfully uploaded user data...")
                     self.userSession = user
                     // MARK: Login / Logout bug fix
                     self.fetchUser()
                 }
             }
        }

    }
    
  
    
    // sign out
    func signOut() {
        ///front end
        self.userSession = nil
        ///Back end
       try? Auth.auth().signOut()
    

    }
    
    // Reset password
    func resetPassword() {
        
    }
    
    // fetch user
    func fetchUser() {
        // MARK: Path to the data location in the backend
//        Firestore.firestore().collection("users").document("x76pe0wdXyT4QEZWLB2deiC0X962").getDocument { snapshot, _ in
//            print(snapshot?.data())
//        }
        // MARK: Get the logged in user uid
        guard let uid = userSession?.uid else { return }
        COLLECTIONS_USERS.document(uid).getDocument { snapshot, _ in
            // Here you create the user from model
            // MARK: Model is like a wrapper for some code
            // MARK: FirebaseFirestoreSwift Mapping to the USER
            guard let user = try? snapshot?.data(as: User.self) else { return }
//            if let user = try? snapshot?.data(as: User.self) {
//                self.currentUser = user
//            } else {
//                print(currentUser?.id ?? "No User")
//                self.signOut()
//            }
            
            
            // MARK: Current User Set Here!
            self.currentUser = user
        }
        
        
        
      
        
    }
    
}
