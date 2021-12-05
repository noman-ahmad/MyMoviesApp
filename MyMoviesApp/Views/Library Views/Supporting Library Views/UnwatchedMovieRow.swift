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
    @StateObject private var coreData = CoreDataManager.shared
    
    
    var body: some View {
        
        
        
        List {
            ForEach(unwatchedViewModel.storedMovies, id:\.id) {
                movie in
                NavigationLink(destination: MovieDetailsView(currentMovie: Int(movie.id))) {
                    LibraryUnwatchedRow(movieEntity: movie, movieId: Int(movie.id))
                }
                .listRowSeparator(.hidden)
            }
        } .refreshable {
            unwatchedViewModel.getAllMoviesUnwatched()
        } .listStyle(InsetListStyle())
        .onAppear(){
            unwatchedViewModel.getAllMoviesUnwatched()
        }

    }
}

struct UnwatchedMovieRow_Previews: PreviewProvider {
    static var previews: some View {
        UnwatchedMovieRow()
    }
}
