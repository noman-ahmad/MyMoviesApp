//
//  MovieReccomendationsView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/3/21.
//

import SwiftUI
import Kingfisher

struct MovieReccomendationsView: View {
    
    var movieReccomendations : [IndividualMovieResponse]
    
    var body: some View {
        
        if movieReccomendations.count > 0 {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text("Reccomended").font(.headline).fontWeight(.bold)
                    Spacer()
                }
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(movieReccomendations, id: \.id) {
                            movie in
                            if let poster_path = movie.poster_path {
                                NavigationLink(destination: MovieDetailsView(currentMovie: movie.id)) {
                                    let url = "https://image.tmdb.org/t/p/w200" + poster_path
                                    KFImage(URL(string: url)).resizable().frame(width: 90, height: 125)
                                }
                            }
                        }
                    }
                }
            }.padding()
        }
    }
}

struct MovieReccomendationsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieReccomendationsView(movieReccomendations: [])
    }
}
