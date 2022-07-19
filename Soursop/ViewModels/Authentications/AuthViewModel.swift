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
    //log in logic
   @Published var userSession: FirebaseAuth.User?
//    @Published var userSession: FirebaseAuth.
    
    
    init() {
        /// mini call to backend to see if user is logged in
        userSession = Auth.auth().currentUser
    }
    
    
    // login
    func login() {
        
        print("Login")
        
    }
    
    // Register
    func register(ithEmail email: String, password: String) {
        print("Register")
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let user = authResult?.user else { return }
            self.userSession = user
            print("Successfully registered user")
        }
//        Auth.auth().addStateDidChangeListener { auth, user in
//            if Auth.auth().currentUser != nil {
//              // User is signed in.
//              // ...
//            } else {
//              // No user is signed in.
//              // ...
//            }
//          // ...
//        }
        
    }
    
  
    
    // sign out
    func signOut() {
        self.userSession = nil

    }
    
    // Reset password
    func resetPassword() {
        
    }
    
    // fetch user
    func fetchUser() {
        
        print(" Fetch user!")
        
    }
    
}
