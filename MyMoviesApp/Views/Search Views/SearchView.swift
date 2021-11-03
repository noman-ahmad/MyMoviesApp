//
//  SearchView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/2/21.
//

import SwiftUI

struct SearchView: View {
    
    private var requestManager = MovieResponseManager()
    @State private var movies = [IndividualMovieResponse]()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(movies, id:\.id) { movie in
                    NavigationLink(destination: Text(movie.original_title)) {
                        SearchRow(currentMovie: movie)
                    }
                }
            }
            // handles search bar logic, search when entered name of movie
            .searchable(text: $searchText)
            .onSubmit(of: .search) {
                Task {
                    if !searchText.isEmpty && searchText.count > 3 {
                        movies = await requestManager.getMovieSearchLoader(queryString: searchText)
                    } else {
                        movies.removeAll()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarTitle("Search For Movies")
        }
    }
    
//    var searchResults: [IndividualMovieResponse] {
//        if searchText.isEmpty {
//            movies = []
//            return []
//        } else {
//            do {
//                Task {
//                    movies = await  requestManager.getSearchResults(queryString: searchText)
//                }
//            } catch {
//                print("Error", error)
//                movies = []
//            }
//            return movies
//        }
//    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
