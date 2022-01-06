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
    var body: some View {
        
        ZStack {
            if isLoading {
                ProgressView()
            } else {
                ScrollView(showsIndicators: false) {
                    MovieImageDescriptionView(moviePosterPath: movieDetailsViewModel.getMoviePosterPath(), movieRating: movieDetailsViewModel.getMovieRating(), movieGenres: movieDetailsViewModel.getMovieGenres(), movieYear: movieDetailsViewModel.getMovieYear(), movieRuntime: movieDetailsViewModel.getMovieRuntime(), movieDirector: movieDetailsViewModel.getMovieDirectors())
                    MovieSynopsisRow(movieDescription: movieDetailsViewModel.getMovieDescription())
                    MovieReccomendationsView(movieId: movieDetailsViewModel.getMovieId())
                    MovieCastRow(movieCast: movieDetailsViewModel.getMovieCast())
                    
                    if let flatrate = movieDetailsViewModel.movieWatchProviders.flatrate {
                        if flatrate.count > 0 {
                            MovieStreamingSitesView(streamingSites: flatrate)
                        }
                    }
                }.navigationBarTitle(movieDetailsViewModel.getMovieName(), displayMode: .inline)
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            if currentState == true {
                                Image(systemName: "checkmark.circle.fill").foregroundColor(.primary)
                            } else {
                                Button {
                                    print("Tapped Here")
                                    currentState = true
                                    movieDetailsViewModel.saveToPersistance()
                                    //addMovieToPersistence()
                                } label : {
                                    if(currentState == false) {
                                        Image(systemName: "plus.circle.fill")
                                    } else {
                                        Image(systemName: "checkmark.circle.fill")
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
                Task {
                    let results = CoreDataManager.shared.getMovieEntity(movieId: movieDetailsViewModel.getMovieId())
                    if(results.count == 0) {
                        currentState = false
                    } else {
                        currentState = true
                    }
                }

            }
            Task {
                await movieDetailsViewModel.getCreditsDetailLoader(movieId: currentMovie)
            }
            Task {
                await movieDetailsViewModel.getMovieReccomendationLoader(movieId: currentMovie)
            }
            
            Task {
                await movieDetailsViewModel.getMovieWatchProvidersLoader(movieId: currentMovie)
            }
        }
    }
    
    func delay() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            isLoading = false
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(currentMovie: -1)
    }
}
