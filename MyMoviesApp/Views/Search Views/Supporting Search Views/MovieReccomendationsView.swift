//
//  MovieReccomendationsView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/3/21.
//

import SwiftUI
import Kingfisher

struct MovieReccomendationsView: View {
    
    @StateObject private var movieReccomendationsVieModel = MovieReccomendationsViewModel()
    var movieId : Int
    
    
    
    var body: some View {
        ZStack {
            if movieReccomendationsVieModel.getReccomendedMovies().count > 0 {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text("Reccomended").font(.headline).fontWeight(.bold)
                        Spacer()
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(movieReccomendationsVieModel.getReccomendedMovies(), id: \.id) {
                                movie in
                                if let poster_path = movie.poster_path {
                                    NavigationLink(destination: MovieDetailsView(currentMovie: movie.id)) {
                                        let url = "https://image.tmdb.org/t/p/w200" + poster_path
                                        KFImage(URL(string: url)).resizable().frame(width: 90, height: 125).border(Color.gray)
                                    }
                                }
                            }
                        }
                    }
                }.padding()
            }
        }.onAppear() {
            movieReccomendationsVieModel.update(movieId: movieId)
        }
    }
}

struct MovieReccomendationsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieReccomendationsView(movieId: -1)
    }
}
