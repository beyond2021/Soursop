//
//  LoginView.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 7/9/22.
//

import SwiftUI

struct LoginView: View {
    @State private  var email = ""
    @State private var password = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.purple
                                                        , Color.mint
                                                          ]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                VStack {
                    Image("Nox_large_white")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 274, height:200)
                    // emailfield
                    VStack (spacing: 20){
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                        
                        
                        // password field
                        CustomSecuredField(text: $password, placeholder: Text("Password"))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                        
                    }
                    
                    
                    // forgot password
                    HStack {
                        Spacer()
                        Button(action: {}) {
                            Text("Forgot Password ?")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.top)
                                .padding(.trailing, 28)
                                
                            
                        }
                    }
                    
                    
                    // sign in
                    Button(action: {
                        viewModel.login()
                        
                    }) {
                        Text("Sign In")
                          .font(.headline)
                        .foregroundColor(.white)
                         .frame(width: 360, height: 50)
                          .background(.mint)
                          .clipShape(Capsule())
                          .padding()
                  }
                    
                    Spacer()
                    NavigationLink(destination: RegistrationView()) {
                        HStack {
                                Text("Dont have an account?")
                                    .font(.system(size: 14))
                                Text("Sign Up")
                                    .font(.system(size: 14, weight: .semibold))
                                
                            }.foregroundColor(.white)
                    }.padding(.bottom, 16)
//
                    
                    // go to sign up
//                    Button(action: {}) {
//
//                    }.padding(32)
//
                    
                    
                    
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
