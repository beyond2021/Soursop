//
//  SearchView.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 6/21/22.
//

import SwiftUI

struct SearchView: View {
    
    @State var serachText = ""
    // switching state variable
    @State var inSearchMode = true
   
    var body: some View {
        ScrollView {
            // Searchbar
            SearchBar(text: $serachText, isEditing: $inSearchMode)
                .padding()
        // Switching Views
            ZStack {
                if inSearchMode {
                    UserListView()
                } else {
                    PostGridView()
                }
            }
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
