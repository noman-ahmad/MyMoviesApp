//
//  MovieDetailsView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/3/21.
//

import SwiftUI
import Kingfisher

struct MovieDetailsView: View {
    
    var currentMovie : Int
    
    @StateObject private var movieDetailsViewModel = MovieDetailsViewModel()
    @State private var currentSegment = 0
        
    var body: some View {
        
        ScrollView {
            MovieImageDescriptionView(moviePosterPath: movieDetailsViewModel.getMoviePosterPath(), movieRating: movieDetailsViewModel.getMovieRating(), movieGenres: movieDetailsViewModel.getMovieGenres(), movieYear: movieDetailsViewModel.getMovieYear(), movieRuntime: movieDetailsViewModel.getMovieRuntime())
            MovieSynopsisRow(movieDescription: movieDetailsViewModel.getMovieDescription())
            MovieReccomendationsView(movieReccomendations: movieDetailsViewModel.getMovieReccomendations())
            MovieCastRow(movieCast: movieDetailsViewModel.getMovieCast())
        }
        .onAppear() {
            Task {
                await movieDetailsViewModel.getMovieDetailLoader(movieId: currentMovie)
            }
            Task {
                await movieDetailsViewModel.getCreditsDetailLoader(movieId: currentMovie)
            }
            Task {
                await movieDetailsViewModel.getMovieReccomendationLoader(movieId: currentMovie)
            }
        } .navigationBarTitle(movieDetailsViewModel.getMovieName(), displayMode: .inline)
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(currentMovie: -1)
    }
}
