//
//  FeedCell.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 6/21/22.
// MARK: THE VIEWMODEL UPDATES THE VIEW WHEN ITS NOTIFIED WHEN THE MODEL IS UPDATED

import SwiftUI
import Kingfisher

struct FeedCell: View {
    // MARK: POPULATED WITH A VIEWMODEL
    @ObservedObject var viewModel : FeedCellViewModel
    
    var didLike: Bool { return viewModel.post.didLike ?? false}
    
    @SceneStorage("isZooming") var isZooming: Bool = false
    
    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
    }
    
    // Tpop Row User-info
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                if let user = viewModel.post.user {
                    
                    
                    
                    NavigationLink(destination:ProfileView(user: user)){
                        // MARK: VM UPDATING THE VIEW
                        KFImage(URL(string: viewModel.post.ownerImageUrl))
                            .resizable()
                            .scaledToFill()
                        
                            .frame(width: 50, height: 50)
                            .overlay(Circle()
                                .stroke(Color.mint, lineWidth: 4))
                            .clipped()
                            .cornerRadius(25)
                        
                        
                        Text(viewModel.post.ownerUsername)
                            .font(.system(size: 14, weight: .semibold))
                        
                    }
                    
                        }
                    
                }.padding([.leading, .bottom], 8)
                // MARK: VM UPDATING THE VIEW
                // Post Image
                KFImage(URL(string: viewModel.post.imageUrl))
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
                Button(action: {
                    // MARK: VM UPDATING THE VIEW
                    didLike ? viewModel.unLike() : viewModel.like()
                }) {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(didLike ? .red : .black)
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                }
                NavigationLink( destination: CommentsView(post: viewModel.post)){
                   
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
            // MARK: VM UPDATING THE VIEW
            Text(viewModel.likeString)
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 10)
                .padding(.bottom, 2)
            
            HStack{
                // MARK: VM UPDATING THE VIEW
                Text(viewModel.post.ownerUsername)
                    .font(.system(size: 14, weight:  .semibold)) +
                Text("  \(viewModel.post.caption)").font(.system(size: 15))
                
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
        ContentView()
    }
}
