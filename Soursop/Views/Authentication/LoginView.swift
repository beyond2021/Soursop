//
//  LoginView.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 7/9/22.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.mint
                                                          ]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                VStack {
                    Image("IG_PHOTO")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 220, height: 100)
                    
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
