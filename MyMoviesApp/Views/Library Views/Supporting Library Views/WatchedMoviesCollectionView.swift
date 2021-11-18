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
        List {
            ForEach(watchedViewModel.storedMovies, id:\.id) {
                movie in
                NavigationLink(destination : UpdateMovieEntryView(movieName: movie.title!, movieId: Int(movie.id), watched_initial: movie.watch_status)) {
                    LibraryWatchedRow(image_url: movie.image_path!, movieTitle: movie.title!, movieRating: movie.rating)
                }
            }
        }.refreshable {
            print("Refreshing Page")
            watchedViewModel.getAllMoviesWatched()
        }.listStyle(InsetListStyle())
    }
}

struct WatchedMoviesCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        WatchedMoviesCollectionView()
    }
}
