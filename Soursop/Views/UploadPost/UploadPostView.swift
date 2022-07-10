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
                .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
                      ImagePicker(image: $selectedImage)
                        
                }
                
            } else {
                
                HStack(alignment: .top) {
                    Image("crystal")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    TextField("Enter your caption", text: $captionText)
                    
                    
                }
                .padding()
                Button(action: {}) {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(.mint)
                        .cornerRadius(5)
                        .foregroundColor(.white)
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
        UploadPostView()
    }
}
