//
//  UploadPostView.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 6/21/22.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var selectedImage: UIImage?
    @State private var postImage: Image?
    @State var captionText = ""
    //pre iOS16
    @State var imagePickerPresented = false
    // iOS 16 and higher
    // MARK: State Object
    @StateObject var photosModel: PhotosPickerModel = .init()
    @ObservedObject var viewModel = UploadPostViewModel()
    //
    @Binding var tabIndex: Int
    
   
    @State var didStartEditing = false

    
    
    
    var body: some View {
        VStack {
            if postImage == nil {
                Button(action: {imagePickerPresented.toggle()}) {
                    VStack {
                        Image(systemName: "plus").font(.title).padding(.bottom, 4)
                        Text("Photo").font(.headline)
                    }
                }
                .padding(30)
                .foregroundColor(.black)
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 2)
                )
                .padding()
                .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
//                      ImagePicker(image: $selectedImage)
                    TwitImagePicker(selectedImage: $selectedImage)
                        
                        
                })
                
            } else if let image = postImage {
                    
                    HStack(alignment: .top) {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 96, height: 96)
                            .clipped()
                        
//                        TextField("Enter your caption", text: $captionText)
//                        TextEditor(text: $captionText)
//                        CustomTextView(text: $captionText, placeholderText: "Enter your caption")
//                        NoxTextView(text: $captionText, didStartEditing: $didStartEditing)
//                               .onTapGesture {
//                                   withAnimation {
//                                       didStartEditing = true
//
//                                   }
//
//                               }
                        CustomTextView(text: $captionText, placeholderText: "Enter your caption")
  
                    }
                    .padding()
                
                
                HStack(spacing: 16) {
                    // MARK: Exit Button
                    Button(action: {
            
                                    captionText = ""
                                    postImage = nil
           
                    }) {
                        Text("Cancel")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 172, height: 50)
                            .background(.red)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                   
                    // MARK: Share Button
                        Button(action: {
                            if let image = selectedImage {
                                viewModel.uploadPost(caption: captionText, image: image) { _ in
                                    withAnimation {
                                        captionText = ""
                                        postImage = nil
                                        // MARK: Back to tab 0
                                        tabIndex = 0
                                        
                                    }
                                    
                                }
                                
                            }
       
                        }) {
                            Text("Share")
                                .font(.system(size: 16, weight: .semibold))
                                .frame(width: 172, height: 50)
                                .background(.mint)
                                .cornerRadius(5)
                                .foregroundColor(.white)
                        }
                     

                    }
                .padding()
                
                
                }
            
            Spacer()
        }
    }
}

// Add the image
extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
    
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
