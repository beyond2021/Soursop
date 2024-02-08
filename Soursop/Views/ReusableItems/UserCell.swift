//
//  UserCell.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 6/25/22.
// MARK: Shows the benefit of the USER object - OOP
// MARK: NP VIEWMODEL NEEDED BECAUSE NOT ACTION INVOLVED

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: User
    var body: some View {
        HStack {
            // Image
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .cornerRadius(24)
            // VStack - username, fullname
            VStack(alignment: .leading.self){
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                
                
                Text(user.fullname)
                    .font(.system(size: 14))
                
            }
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
