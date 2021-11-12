//
//  SearchView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/2/21.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var viewModel = SearchViewModel()
    
    @State private var searchText = ""
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.movieResults, id: \.id) {
                    movie in
                    SearchRow(image_url: movie.image, movie_name: movie.title, movie_year: movie.description)
                }
            }.searchable(text: $searchText)
             .onSubmit(of: .search) {
                 Task {
                     if searchText.count >= 3 {
                         await viewModel.getSearchResultsLoader(queryString: searchText)
                     }
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
