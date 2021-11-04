//
//  MovieReccomendationsView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/3/21.
//

import SwiftUI
import CachedAsyncImage

struct MovieReccomendationsView: View {
    
    var recommended = [IndividualMovieResponse()]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(recommended, id: \.id) {
                    movie in
                    NavigationLink(destination: MovieDetailsView(movieId: movie.id)) {
                        if let poster_path = movie.poster_path {
                            let url = "https://image.tmdb.org/t/p/original/" + poster_path
                            CachedAsyncImage(url: URL(string: url)) {
                                image in image
                                    .resizable()
                            } placeholder: {
                                ProgressView()
                            }.frame(width: 125, height: 175).background(Color.gray)
                        } else {
                            Image("placeholder-poster").resizable().frame(width: 125, height: 175)
                        }
                    }
                }
            }
        }
    }
}

struct MovieReccomendationsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieReccomendationsView()
    }
}
