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
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            Menu {
                                Picker(selection : $sortingOption, label: Text("Sorting Options")) {
                                    Text("Rating").tag(0)
                                    Text("Date Added").tag(1)
                                    Text("Name").tag(2)
                                }
                            }
                        label: {
                            Label("Sort", systemImage: "arrow.up.arrow.down.circle.fill")
                        }
                        }
                    }
            } else {
                VStack {
                    Spacer()
                    Text("Add Some Movies to View Them Here").foregroundColor(Color.secondary)
                    Spacer()
                }
            }

        }.onAppear {
            watchedViewModel.getAllMoviesWatched()
            handleSorting()
        }
    }

private func handleSorting() {
        if(sortingOption == 0) {
            watchedViewModel.storedMovies = watchedViewModel.storedMovies.sorted{$0.rating > $1.rating}
        }
        else if(sortingOption == 1) {
            watchedViewModel.storedMovies = watchedViewModel.storedMovies.sorted{$0.date_added! < $1.date_added!}
        } else {
            watchedViewModel.storedMovies = watchedViewModel.storedMovies.sorted{$0.title! < $1.title!}
        }
}
}

struct WatchedMoviesCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        WatchedMoviesCollectionView()
    }
}
