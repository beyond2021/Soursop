//
//  UserStatsView.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 6/29/22.
//

import SwiftUI

struct UserStatsView: View {
    let value: Int
    let title: String
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.system(size: 15, weight: .semibold))
            Text(title)
                .font(.system(size: 15))
        }.frame(width: 80, alignment: .center)
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView(value: 1, title: "Post")
    }
}
