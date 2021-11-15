//
//  MovieDetailsView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/3/21.
//

import CoreData
import SwiftUI
import Kingfisher

struct MovieDetailsView: View {
    
    var currentMovie : Int
    
    @StateObject private var movieDetailsViewModel = MovieDetailsViewModel()
    @State private var isLoading = false
    @State private var currentState = false
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: StoredMovie.entity(), sortDescriptors: []) var movies: FetchedResults<StoredMovie>

    var body: some View {
        
        ZStack {
            if isLoading {
                ProgressView()
            } else {
                ScrollView {
                    MovieImageDescriptionView(moviePosterPath: movieDetailsViewModel.getMoviePosterPath(), movieRating: movieDetailsViewModel.getMovieRating(), movieGenres: movieDetailsViewModel.getMovieGenres(), movieYear: movieDetailsViewModel.getMovieYear(), movieRuntime: movieDetailsViewModel.getMovieRuntime(), movieDirector: movieDetailsViewModel.getMovieDirectors())
                    MovieSynopsisRow(movieDescription: movieDetailsViewModel.getMovieDescription())
                    MovieReccomendationsView(movieReccomendations: movieDetailsViewModel.getMovieReccomendations())
                    MovieCastRow(movieCast: movieDetailsViewModel.getMovieCast())
                }.navigationBarTitle(movieDetailsViewModel.getMovieName(), displayMode: .inline)
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            if currentState == true {
                                Image(systemName: "checkmark")
                            } else {
                                Button {
                                    print("Tapped Here")
                                    currentState = true
                                    addMovieToPersistence()
                                } label : {
                                    if(currentState == false) {
                                        Image(systemName: "plus")
                                    } else {
                                        Image(systemName: "checkmark")
                                }
                            }
                        }
                    }
                }
            }
        }
        .onAppear() {
            delay()
            Task {
                await movieDetailsViewModel.getMovieDetailLoader(movieId: currentMovie)
            }
            Task {
                await movieDetailsViewModel.getCreditsDetailLoader(movieId: currentMovie)
            }
            Task {
                await movieDetailsViewModel.getMovieReccomendationLoader(movieId: currentMovie)
            }
            Task {
                for movies in movies {
                    if movies.id == currentMovie {
                        currentState = true
                        break
                    }
                }
            }
        }
    }
    
    
    func addMovieToPersistence() {
        let newMovie = StoredMovie(context: self.moc)
        newMovie.id = Int64(movieDetailsViewModel.getMovieId())
        newMovie.title = movieDetailsViewModel.getMovieName()
        newMovie.watch_status = false
        newMovie.rating = 0
        newMovie.review = ""
        newMovie.image_path = movieDetailsViewModel.getMoviePosterPath()
        do {
            try self.moc.save()
        }catch {
            print("Didnt Work")
        }
    }
    
    func delay() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            isLoading = false
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(currentMovie: -1)
    }
}
