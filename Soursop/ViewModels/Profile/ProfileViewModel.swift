//
//  ProfileViewModel.swift
//  Nox
//
//  Created by KEEVIN MITCHELL on 9/18/22.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    // MARK: Persistence 2 TODO
//    @AppStorage("log_status") var logStatus: Bool = false
    // MARK: Model should be in Viewmodel NOT the View (MVVM)
    @Published var user: User
    
    init(user: User) {
        self.user = user
        self.checkIfUserIsFollowed()
    }
    
    // MARK: Follow
    func follow() {
        guard let uid = user.id else { return }
        UserService.follow(uid: uid) { _ in
            // MARK: SEND NOTIFICATION FROM STATIC FUNC _ NO INITILIZATION NEEDED
            NotificationsViewModel
                .uploadNotification(toUID: uid, type: .follow)
            // MARK: Backend success here. UpdateUI
//            print("DEBUG: Successfully following \(self.user.username)")
            // MARK: triggers UI update/ UPDATING THE MODEL
            self.user.isFollowed = true
        }
        
    }
    
    // MARK: Follow
    func unFollow() {
        guard let uid = user.id else { return }
        UserService.unFollow(uid: uid) { _ in
            // MARK: Backend success here. UpdateUI
//            print("DEBUG: Successfully following \(self.user.username)")
            // MARK: triggers UI update/ UPDATING THE MODEL
            self.user.isFollowed = false
        }
        
    }
    
    // MARK: PERSISTENSE
    func checkIfUserIsFollowed() {
        guard !user.isCurrentUser else { return } /// you cant follow yourself
        guard let uid = user.id else { return }
        UserService.checkIfUserIsFollowed(uid: uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
        
    }
}
