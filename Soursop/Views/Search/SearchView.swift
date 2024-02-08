//
//  SearchView.swift
//  Soursop
//
//  Created by KEEVIN MITCHELL on 6/21/22.
// PARENT VIEW FOR USERLISTVIEW
// CONTAINS  SEARCHBAR, USERLISTVIEW AND POSTGRIDVIEW

import SwiftUI

struct SearchView: View {
    @ObservedObject var searchViewModel = SearchViewModel()
    
    @State var searchText = ""
    // switching state variable
    @State var inSearchMode = true
   
    var body: some View {
        ScrollView {
            // Searchbar
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
        // Switching Views
            ZStack {
                if inSearchMode {
                    // MARK: Passing the vm to the UserListView
                    UserListView(searchViewModel: searchViewModel, searchText: $searchText)
                } else {
                    PostGridView(config: .explore) // MARK: REUSABLE
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
