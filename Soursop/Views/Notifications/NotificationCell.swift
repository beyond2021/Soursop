//
//  NotificationCell.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 6/28/22.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
   @ObservedObject var viewModel: NotificationCellViewModel
    
    
    // MARK: INJECTING VIEWMODEL AND NOTIFICATION WHEN ITS CREATED
    
    init(notification: Notification) {
        self.viewModel = NotificationCellViewModel(notification: notification)
    }
    
    var isFollowed: Bool { viewModel.notification.isFollowed ?? false }
    
    @State private var showPostImage = true
    var body: some View {
        HStack {
            if let user = viewModel.notification.user {
                NavigationLink(destination: ProfileView(user: user)) {
                    KFImage(URL(string: viewModel.notification.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .cornerRadius(24)
                       
                     //   .clipShape(Circle())
                    Text(viewModel.notification.username)
                        .font(.system(size: 14, weight:  .semibold)) +
                    Text(viewModel.notification.type.notificationMessage).font(.system(size: 15))
                }
            }
            Spacer()
            if (viewModel.notification.type != .follow){
                if let post = viewModel.notification.post {
//                    FeedCell(viewModel: FeedCellViewModel(post:post)) used in postgridview
                    NavigationLink(destination: FeedCell(viewModel: FeedCellViewModel(post:post))) {
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .cornerRadius(3)
                            .clipped()
                    }
                }
                
            } else {
                Button(action: {
                    isFollowed ? viewModel.unFollow() : viewModel.follow()
                    
                }) {
                    Text( isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 100, height: 32)
                        .background(isFollowed ? Color.white : .mint)
                        .foregroundColor(isFollowed ? .black : .white
                        )
                        .cornerRadius(3)
                    
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.mint, lineWidth: isFollowed ? 1 : 0)
                        
                        )
                }
                
            }
            
        }.padding(.horizontal, 4
        )
    }
}

//struct NotificationCell_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationCell()
//    }
//}
