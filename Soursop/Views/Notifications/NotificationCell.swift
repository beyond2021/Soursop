//
//  NotificationCell.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 6/28/22.
//

import SwiftUI

struct NotificationCell: View {
    @State private var showPostImage = true
    var body: some View {
        HStack {
            Image("girls")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .cornerRadius(24)
               
             //   .clipShape(Circle())
            Text("Shotta")
                .font(.system(size: 14, weight:  .semibold)) +
            Text(" Liked one of your posts").font(.system(size: 15))
            Spacer()
            if showPostImage {
                Image("crystal")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipped()
                
            } else {
                Button(action: {}) {
                    Text("Follow")
                        .padding(.horizontal, 20)
                        .padding(.vertical,8)
                        .background(Color(.systemMint))
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold))
                }
                
            }
            
        }.padding(.horizontal, 4
        )
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
