//
//  NoxTextView.swift
//  Nox
//
//  Created by KEEVIN MITCHELL on 9/24/22.
//

import SwiftUI

struct NoxTextView: UIViewRepresentable {

@Binding var text: String
@Binding var didStartEditing: Bool


func makeUIView(context: Context) -> UITextView {
    let textView = UITextView()
    
    textView.font = UIFont.preferredFont(forTextStyle: .body)
    textView.autocapitalizationType = .sentences
    textView.isSelectable = true
    textView.isUserInteractionEnabled = true
    
    return textView
}


func updateUIView(_ uiView: UITextView, context: Context) {
    
    if didStartEditing {
        
        uiView.textColor = UIColor.black
        uiView.text = text
        
    }
    else {
        uiView.text = "Enter Caption Here"
        uiView.textColor = UIColor.lightGray
    }
    
    uiView.font = UIFont.preferredFont(forTextStyle: .body)
    
}
}
