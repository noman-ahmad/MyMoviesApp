//
//  SearchView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/2/21.
//

import SwiftUI

struct SearchView: View {
    
    @State private var movies = [IndividualMovieResponse]()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(movies, id:\.id) { movie in
                    NavigationLink(destination: MovieDetailsView(movieId: movie.id)) {
                        SearchRow(currentMovie: movie)
                    }
                }
            }.listStyle(GroupedListStyle())
            // handles search bar logic, search when entered name of movie
            .searchable(text: $searchText)
            .onSubmit(of: .search) {
                Task {
                    let searchString = searchText.replacingOccurrences(of: " ", with: "%20")
                    if !searchString.isEmpty{
                        movies = await requestManager.getMovieSearchLoader(queryString: searchString)
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
