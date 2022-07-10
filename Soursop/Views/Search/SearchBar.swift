//
//  SearchBar.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 6/25/22.
//

import SwiftUI
import UIKit

struct SearchBar: View {
    // Binding Variables
    @Binding var text: String
    //switcher
    @Binding var isEditing: Bool
    
    @State private var animationAmount = 1.0
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                    }
                    
                )
                .onTapGesture {
                    // switching
                    isEditing = true
                }
            // cancel button
            if isEditing {
                Button(action: {
                    isEditing = false
                    text = ""
                    UIApplication.shared.endEditing()// extension
                }
                       
                ) {
                    Text("Cancel")
                        .foregroundColor(.black)
                    
                }
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing)) // Button animation
                .animation(.default, value:  animationAmount)
                .onAppear{
                    animationAmount = 1.5
                }
                
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search..."), isEditing: .constant(true))
    }
}
