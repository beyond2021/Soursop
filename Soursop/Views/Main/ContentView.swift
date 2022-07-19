//
//  ContentView.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 6/21/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            // if not logged in show login view
            /// logic set in AuthViewModel, session is setR
            if viewModel.userSession == nil {
                LoginView()
            } else {
                //else show main interface
                MainTabView()
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
