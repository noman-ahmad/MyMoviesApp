//
//  HomePopularMoviesView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/7/21.
//

import SwiftUI
import Kingfisher

struct HomePopularMoviesView: View {
    
    var popularMovies = [IndividualMovieResponse()]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(popularMovies, id: \.id) {
                    movie in
                    if let poster_path = movie.poster_path {
                        NavigationLink(destination: MovieDetailsView(movieId: movie.id)) {
                                let url = "https://image.tmdb.org/t/p/w200/" + poster_path
                                    KFImage(URL(string: url))
                                        .resizable()
                                        .frame(width: 100, height: 125)
                        }
                    }
                }
            }
        }
    }
}

struct HomePopularMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        HomePopularMoviesView()
    }
}
