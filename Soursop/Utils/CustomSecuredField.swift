//
//  CustomSecuredField.swift
//  Nox
//
//  Created by KEEVIN MITCHELL on 7/9/22.
//

import SwiftUI

struct CustomSecuredField: View {
    @Binding var text: String
    
    let placeholder: Text

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha:0.8) ))
                    .padding(.leading, 40)
            }
            HStack {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                SecureField("", text: $text)
            }
            
        }
    }
}


