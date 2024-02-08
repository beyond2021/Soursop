//
//  CustomInputView.swift
//  Nox
//
//  Created by KEEVIN MITCHELL on 9/29/22.
//

import SwiftUI

struct CustomInputView: View {
    @Binding var inputText: String
   // MARK: Action that doesnt return anything
    var action: () -> Void
    var body: some View {
        VStack {
            // divider
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                .padding(.bottom,8)
            
            //HStack with texfield and send button
            HStack {
                TextField("Comments...", text: $inputText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)
                Button(action: action) {
                    Text("Send")
                        .bold()
                        .foregroundColor(.black)
                }

            }
            .padding(.bottom, 8)
            .padding(.horizontal)
        }
        
    }
}

struct CustomInputView_Previews: PreviewProvider {
    @State var inputText = ""
    static var previews: some View {
        CustomInputView(inputText: .constant(""), action: theAction)
    }
}

func theAction() {

}
