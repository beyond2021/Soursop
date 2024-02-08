//
//  ContentView.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 6/21/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var selectedIndex = 0
    
    var body: some View {
        Group {
            // if not logged in show login view
            /// logic set in AuthViewModel, session is setR
            // MARK: whenusersession changes Group is redrawn
            if viewModel.userSession == nil {
                LoginView()
            } else {
                //else show main interface

//                    MainTabView()
                    if let user = viewModel.currentUser {
//                        MainView(user: user)
                        MainTabView(selectedIndex: $selectedIndex, user: user)
                        
                    } else {
                        EmptyView()
                    }
             
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
