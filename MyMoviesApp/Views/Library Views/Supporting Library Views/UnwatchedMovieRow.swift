//
//  UnwatchedMovieRow.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/13/21.
//

import SwiftUI
import Kingfisher

struct UnwatchedMovieRow: View {
    @StateObject private var unwatchedViewModel = UnwatchedMoviesViewModel()
    
    
    var body: some View {
        
        ZStack {
            if(unwatchedViewModel.storedMovies.count > 0) {
                List {
                    ForEach(unwatchedViewModel.storedMovies, id:\.id) {
                        movie in
                        if let review = movie.review {
                            if let title = movie.title {
                                NavigationLink(destination : UpdateMovieEntryView(movieWatched: movie.watch_status, movieReview: review, movieRating: String(movie.rating), movieName: title, movieId: Int(movie.id))) {
                                    if let image_path = movie.image_path {
                                        if let movie_title = movie.title {
                                            SearchRow(movieTitle: movie_title, movieYear: "", image_url: image_path)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }.refreshable {
                    print("Refreshing Page")
                    unwatchedViewModel.getAllMoviesUnwatched()
                }
                .listStyle(InsetListStyle())
            } else {
                VStack {
                    Spacer()
                    Text("Add Some Movies To See Them Here").foregroundColor(Color.secondary)
                    Spacer()
                }
            }

        }.onAppear {
            unwatchedViewModel.getAllMoviesUnwatched()
        }
    }
}

struct UnwatchedMovieRow_Previews: PreviewProvider {
    static var previews: some View {
        UnwatchedMovieRow()
    }
}
