//
//  ProfileView.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 6/21/22.
//

import SwiftUI

struct ProfileView: View {
    // MARK: View has an instance of the viewmodel(MVVM)
    @ObservedObject var viewModel: ProfileViewModel
    // MARK: user needed
    let user: User
    
    // MARK: initializer to set user coming in from the view model
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
        
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView(viewModel: viewModel)
                
                PostGridView(config: .profile(user.id ?? ""))
            }.padding(.top)
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
