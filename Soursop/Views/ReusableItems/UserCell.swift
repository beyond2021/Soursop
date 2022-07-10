//
//  UserCell.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 6/25/22.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            // Image
            Image("girls")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .cornerRadius(24)
            // VStack - username, fullname
            VStack(alignment: .leading.self){
                Text("Crystal")
                    .font(.system(size: 14, weight: .semibold))
                
                
                Text("Robin")
                    .font(.system(size: 14))
                
            }
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
