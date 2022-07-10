//
//  FeedCell.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 6/21/22.
//

import SwiftUI

struct FeedCell: View {
    @SceneStorage("isZooming") var isZooming: Bool = false
    // Tpop Row User-info
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Image("crystal")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                Text("Crystal")
                    .font(.system(size: 14, weight: .semibold))
            }.padding([.leading, .bottom], 8)
            // Post Image
            Image("crystal")
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 440)
                .clipped()
                .addPinchZoom()
            
                .background(.ultraThinMaterial)
                // Hiding Nav Bar...
                .offset(y: isZooming ? -200 : 0)
                .animation(.easeInOut, value: isZooming)
           
            
            //action Buttons stack
            HStack(spacing: 16) {
                Button(action: {}) {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                }
                Button(action: {}) {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                }
                Button(action: {}) {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                }
            }
            .padding(.leading, 4)
            .foregroundColor(.purple) //.black
            
            //caption
            Text("25 likes")
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            HStack{
                Text("Shotta")
                    .font(.system(size: 14, weight:  .semibold)) +
                Text(" We are the baddest, they will learn not to play with us, some bwoy a guh feel it").font(.system(size: 15))
                
            }.padding(.horizontal, 8)
            
            Text("2d")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top, 2)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
