//
//  WatchedMoviesCollectionView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/17/21.
//

import SwiftUI

struct WatchedMoviesCollectionView: View {
    @StateObject private var watchedViewModel = WatchedMoviesViewModel()
    
    @State private var sortingOption = 0
    
    
    
    var body: some View {
        
        List {
            ForEach(watchedViewModel.storedMovies, id:\.id) {
                movie in
                NavigationLink(destination: MovieDetailsView(currentMovie: Int(movie.id))) {
                    LibraryWatchedRow(movieEntity: movie, movieId: Int(movie.id))
                }
            }
        } .refreshable {
            watchedViewModel.getAllMoviesWatched()
        } .listStyle(InsetListStyle())
          .onAppear() {
            watchedViewModel.getAllMoviesWatched()
        }
    }
}



struct WatchedMoviesCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        WatchedMoviesCollectionView()
    }
}
