//
//  CustomTextView.swift
//  Nox
//
//  Created by KEEVIN MITCHELL on 9/24/22.
//

import SwiftUI

struct CustomTextView: View {
    @Binding var text: String
    let placeholderText: String
    
    init(text: Binding<String>, placeholderText: String) {
        self._text = text
        self.placeholderText = placeholderText
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $text)
                .padding(4)
            
            if text.isEmpty {
                Text(placeholderText)
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
                
            }
           
    
        }
        .font(.body)
    }
}

struct CustomTextView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
