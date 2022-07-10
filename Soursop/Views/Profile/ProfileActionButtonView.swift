//
//  ProfileActionButtonView.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 6/29/22.
//

import SwiftUI

struct ProfileActionButtonView: View {
    var isCurrentUser = true
    var isFollowed = false
    var body: some View {
        if isCurrentUser {
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
                Button(action: {}) {
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
        ProfileActionButtonView()
    }
}
