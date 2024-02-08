//
//  CommentsCell.swift
//  Nox
//
//  Created by KEEVIN MITCHELL on 9/28/22.
//

import SwiftUI
import Kingfisher

struct CommentsCell: View {
    let comment: Comment
    var body: some View {
        HStack {
            KFImage(URL(string: comment.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            Text(comment.username)
                .font(.system(size: 14, weight: .semibold)) +
            Text(" \(comment.commentText)")
                .font(.system(size: 14))
            Spacer()
            Text("2m")
                .foregroundColor(.gray)
                .font(.system(size: 12))
                .padding(.trailing)
        }.padding(.horizontal)
    }
}

//struct CommentsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentsCell()
//    }
//}
