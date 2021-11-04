//
//  MovieDetailsDescriptionView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/3/21.
//

import SwiftUI
import CachedAsyncImage

struct MovieDetailsDescriptionView: View {
    
    var movieDetails : IndividualMovieDetailResponse
    
    var body: some View {
        HStack {
            if let description = movieDetails.overview {
                Text(description).font(.caption).multilineTextAlignment(.leading)
            } else {
                Text("Description Not Found")
            }
        }.padding(.top).padding(.bottom)
    }
}

struct MovieDetailsDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsDescriptionView(movieDetails: IndividualMovieDetailResponse())
    }
}
