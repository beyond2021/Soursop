//
//  MainTabView.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 6/21/22.
//

import SwiftUI

struct MainTabView: View {
    // MARK: Tab selection
    @Binding var selectedIndex: Int
    // MARK: User
    let user: User
    var body: some View {
        NavigationView {
            TabView(selection: $selectedIndex) {
                FeedView()
                    .onTapGesture {
                        // MARK: Manually setting the index
                        selectedIndex = 0
                    }
                    .tabItem {
                        Image(systemName: "house.circle")
                    }.tag(0)
                
                
                SearchView()
                    .onTapGesture {
                        selectedIndex = 1
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }.tag(1)
                
                
                UploadPostView( tabIndex: $selectedIndex)
                    .onTapGesture {
                        selectedIndex = 2
                    }
                    .tabItem {
                        Image(systemName: "plus.square")
                    }.tag(2)
                
                
                NotificationsView()
                    .onTapGesture {
                        selectedIndex = 3
                    }
                    .tabItem {
                        Image(systemName: "newspaper.circle")
                    }.tag(3)
                
                
                ProfileView(user: user)
                    .onTapGesture {
                        selectedIndex = 4
                    }
                    .tabItem {
                        Image(systemName: "person.circle")
                    }.tag(4)
                
            }
            .navigationTitle(tabTitle)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: logoutButton)
            .accentColor(.black)
        }
    }
    /// Log out button logic
    var logoutButton: some View {
        Button(action: {
            AuthViewModel.shared.signOut()
        }) {
            Text("Logout")
                .foregroundColor(.black)
        }
    }
    var tabTitle: String {
        switch selectedIndex {
        case 0:
            return "Feed"
        case 1:
            return "Search"
        case 2:
            return "Upload"
        case 3:
            return "Notifications"
        case 4:
            return "Profile"
        default:
            return ""
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
