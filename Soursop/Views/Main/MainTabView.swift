//
//  MainTabView.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 6/21/22.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        NavigationView {
            TabView {
                FeedView()
                    .tabItem {
                        Image(systemName: "house.circle")
                    }
                
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                
                
                UploadPostView()
                    .tabItem {
                        Image(systemName: "plus.square")
                    }
                
                
                NotificationsView()
                    .tabItem {
                        Image(systemName: "newspaper.circle")
                    }
                
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.circle")
                    }
                
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .accentColor(.black)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
