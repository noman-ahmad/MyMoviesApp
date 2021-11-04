//
//  MovieImageDescriptionView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/3/21.
//

import SwiftUI
import CachedAsyncImage

struct MovieImageDescriptionView: View {
    
    var movieDetails : IndividualMovieDetailResponse
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                if let poster_path = movieDetails.poster_path {
                    let url = "https://image.tmdb.org/t/p/original/" + poster_path
                    CachedAsyncImage(url: URL(string: url)) {
                        image in image
                            .resizable()
                    } placeholder: {
                        ProgressView()
                    }.frame(width: 200, height: 300).cornerRadius(10).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 3))
                } else {
                    Image("placeholder-poster").resizable().frame(width:150, height: 200)
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct MovieImageDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        MovieImageDescriptionView(movieDetails: IndividualMovieDetailResponse())
    }
}