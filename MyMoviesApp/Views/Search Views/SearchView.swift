//
//  SearchView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/2/21.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @StateObject private var searchViewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchViewModel.getMovies(), id: \.id) {
                    movie in
                    NavigationLink(destination: MovieDetailsView(currentMovie: searchViewModel.getMovieId(movie: movie))) {
                        SearchRow(movieTitle: movie.title, movieYear: searchViewModel.getMovieDate(movie: movie), image_url: searchViewModel.getMoviePosterURL(movie: movie))
                    }.onAppear {
                            if (movie == searchViewModel.getMovies().last) {
                                Task {
                                    await searchViewModel.getSearchResultsLoader(queryString: searchText)
                                }
                            }
                        }
                }
            }.searchable(text: $searchText, prompt: "Search By Name...").onSubmit(of: .search) {
                Task {
                    if searchText.count >= 3 {
                        searchViewModel.removeAllMovies()
                        await searchViewModel.getSearchResultsLoader(queryString: searchText)
                    } else {
                        searchViewModel.removeAllMovies()
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("My Movies App")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
