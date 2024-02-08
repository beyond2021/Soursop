//
//  RegistrationView.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 7/9/22.
//

import SwiftUI

struct RegistrationView: View {
    @State private  var email = ""
    @State private  var fullname = ""
    @State private  var username = ""
    @State private var password = ""
    
    @State private var selectedImage: UIImage?
    @State private var image: Image?
    //pre iOS16
    @State var imagePickerPresented = false
    @Environment(\.presentationMode) var mode
    
    //
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple
                                                    , Color.mint
                                                      ]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            VStack {
                // Check if there is an image
                if let image = image {

                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .clipShape(Circle())
                            .foregroundColor(.white)



                    .padding()


                } else {

                    Button(action: {imagePickerPresented.toggle()}) {
                        VStack {
                            Image(systemName: "plus").font(.title).padding(.bottom, 4)
                            Text("Photo").font(.headline)
                        }
                    }
                    .padding(30)
                    .foregroundColor(.white)
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 2)
                    )
                    .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
                         // ImagePicker(image: $selectedImage)
                        TwitImagePicker(selectedImage: $selectedImage)

                    }
                    .padding()
             }
        
              
                // emailfield
                VStack (spacing: 20){
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)

                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)

                    CustomTextField(text: $fullname, placeholder: Text("Full Name"), imageName: "person")
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

                
               
                // sign in
                Button(action: {viewModel.register(withEmail: email, password: password, image: selectedImage, fullname: fullname, username: username)}) {
                    Text("Sign Up")
                      .font(.headline)
                    .foregroundColor(.white)
                     .frame(width: 360, height: 50)
                      .background(.mint)
                      .clipShape(Capsule())
                      .padding()
              }
                
                Spacer()

                
                Button(action: {mode.wrappedValue.dismiss()}) {
                    HStack {
                            Text("Already have an account?")
                                .font(.system(size: 14))
                            Text("Sign In")
                                .font(.system(size: 14, weight: .semibold))

                        }.foregroundColor(.white)
                }

                
            }
               
        }
    }
   
}

// Add the image
extension RegistrationView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        image = Image(uiImage: selectedImage)
    }
    
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

//Image("Nox_large_white")
//    .resizable()
//    .scaledToFit()
//    .frame(width: 274, height:200)
