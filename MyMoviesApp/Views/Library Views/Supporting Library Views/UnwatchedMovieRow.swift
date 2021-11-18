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
        if(unwatchedViewModel.storedMovies.count > 0) {
            List {
                ForEach(unwatchedViewModel.storedMovies, id:\.id) {
                    movie in
                    NavigationLink(destination : UpdateMovieEntryView(movieName: movie.title!, movieId: Int(movie.id), watched_initial: movie.watch_status)) {
                        if let image_path = movie.image_path {
                            if let movie_title = movie.title {
                                SearchRow(movieTitle: movie_title, movieYear: "", image_url: image_path)
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
            Text("Add Some Views To See Them Here").foregroundColor(Color.secondary)
        }
    }
}

struct UnwatchedMovieRow_Previews: PreviewProvider {
    static var previews: some View {
        UnwatchedMovieRow()
    }
}
