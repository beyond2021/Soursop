//
//  ProfileActionButtonView.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 6/29/22.
//

import SwiftUI

struct ProfileActionButtonView: View {
    // MARK: passed all the way dow to here as an observed object
    @ObservedObject var viewModel: ProfileViewModel
    
    
    // MARK: Updates the UI - changes the state of the button
    var isFollowed : Bool {
        // MARK: Computed property to update state
        return viewModel.user.isFollowed ?? false
    }
    var body: some View {
        if viewModel.user.isCurrentUser {
            // edit profile button
            Button(action: {}) {
                Text("Edit Profile")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black
                    )
                
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.mint, lineWidth: 1)
                    
                    )
            }
        } else {
            // follow and message button
            HStack {
                Button(action: {isFollowed ? viewModel.unFollow() : viewModel.follow()}) {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .background(isFollowed ? Color.white : .mint)
                        .foregroundColor(isFollowed ? .black : .white
                        )
                    
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.mint, lineWidth: isFollowed ? 1 : 0)
                        
                        )
                }.cornerRadius(3)
                Button(action: {}) {
                    Text("Message")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(.black
                        )
                    
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.mint, lineWidth: 1)
                        
                        )
                }
            }
        }
    }
}

struct ProfileActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
