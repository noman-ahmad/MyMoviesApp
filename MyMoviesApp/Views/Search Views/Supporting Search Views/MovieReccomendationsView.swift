//
//  MovieReccomendationsView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/3/21.
//

import SwiftUI
import Kingfisher

struct MovieReccomendationsView: View {
    
    var recommended = [IndividualMovieResponse()]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(recommended, id: \.id) {
                    movie in
                    if let poster_path = movie.poster_path {
                        NavigationLink(destination: MovieDetailsView(movieId: movie.id)) {
                                let url = "https://image.tmdb.org/t/p/w200/" + poster_path
                                KFImage(URL(string: url))
                                        .resizable()
                                .frame(width: 125, height: 175)
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
