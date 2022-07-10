//
//  ProfileHeaderView.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 6/28/22.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("girls")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                .cornerRadius(40)
                .padding(.leading)
                Spacer()
                HStack( spacing: 16) {
                    UserStatsView(value: 1, title: "Post")
                    UserStatsView(value: 2, title: "Followers")
                    UserStatsView(value: 4, title: "Following")
                }.padding(.trailing, 32)
            }
            Text("Roy Jones")
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
            Text("I'm the muddafucka man dog!! | Billionaire")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)
            
            HStack {
                Spacer()
               ProfileActionButtonView()
                Spacer()
            }
            .padding(.top)
            
        }
    }
}



struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
