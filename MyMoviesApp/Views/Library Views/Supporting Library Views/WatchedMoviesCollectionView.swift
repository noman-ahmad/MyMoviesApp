//
//  WatchedMoviesCollectionView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/17/21.
//

import SwiftUI

struct WatchedMoviesCollectionView: View {
    @StateObject private var watchedViewModel = WatchedMoviesViewModel()
    
    
    var body: some View {
        
        ZStack {
            if(watchedViewModel.storedMovies.count > 0) {
                List {
                    ForEach(watchedViewModel.storedMovies, id:\.id) {
                        movie in
                        
                        if let title = movie.title {
                            if let review = movie.review {
                                NavigationLink(destination : UpdateMovieEntryView(movieWatched: movie.watch_status, movieReview: review, movieRating: String(movie.rating), movieName: title, movieId: Int(movie.id))) {
                                    LibraryWatchedRow(image_url: movie.image_path!, movieTitle: title, movieRating: movie.rating, movieReview: review)
                                }
                            }
                        }
                    }
                }.refreshable {
                    print("Refreshing Page")
                    
                    watchedViewModel.getAllMoviesWatched()
                }.listStyle(InsetListStyle())
            } else {
                VStack {
                    Spacer()
                    Text("Add Some Movies to View Them Here").foregroundColor(Color.secondary)
                    Spacer()
                }
            }

        }.onAppear {
            watchedViewModel.getAllMoviesWatched()
        }
    }
}

struct WatchedMoviesCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        WatchedMoviesCollectionView()
    }
}
