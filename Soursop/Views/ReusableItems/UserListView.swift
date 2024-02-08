//
//  UserListView.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 6/25/22.
// CHILDVIEW

import SwiftUI

struct UserListView: View {
    // MARK: DO NOT INITIALIZE BECAUSE API WILL BE CALLED TWICE
    @ObservedObject var searchViewModel: SearchViewModel
    // MARK: BINDING FOR FILTERING - BINDED TO STATE VARIABLE IN SEARCHVIEW
    @Binding var searchText: String
    var users: [User] {
        return searchText.isEmpty ? searchViewModel.users : searchViewModel.filteredUsers(searchText)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(users) { user in
                    NavigationLink(destination: ProfileView(user: user)) {
                        UserCell(user: user)
                            .padding(.leading)
                    }

                    
                }
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
