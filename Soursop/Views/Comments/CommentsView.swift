//
//  CommentsView.swift
//  Nox
//
//  Created by KEEVIN MITCHELL on 9/28/22.
//

import SwiftUI

struct CommentsView: View {
    @State var commentText = ""
    @ObservedObject var viewModel : CommentsViewModel

    
    init(post: Post) {
        // MARK: Post is only needed the make the CommentsViewModel
        self.viewModel = CommentsViewModel(post: post)
    }
    
    var body: some View {
        VStack {
            // Comment list cells
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24){
                    ForEach(viewModel.comments) { comment in
                        CommentsCell(comment: comment)  
                    }
                    
                }
            }.padding(.top)
            // comment Input
            CustomInputView(inputText: $commentText, action: uploadComment)
            
        }
    }
    func uploadComment() {
        viewModel.uploadComments(commentText: commentText)
        commentText = ""
        
    }
}

