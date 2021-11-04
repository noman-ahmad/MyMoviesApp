//
//  SearchRow.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/2/21.
//

import SwiftUI
import CachedAsyncImage

struct SearchRow: View {
    
    var currentMovie : IndividualMovieResponse
    
    var body: some View {
        HStack() {
            VStack {
                Spacer()
                if let poster_path = currentMovie.poster_path {
                    let url = "https://image.tmdb.org/t/p/original/" + poster_path
                    CachedAsyncImage(url: URL(string: url)) {
                        image in image
                            .resizable()
                    } placeholder: {
                        ProgressView()
                    }.frame(width: 75, height: 100).background(Color.gray)
                } else {
                    Image("placeholder-poster").resizable().frame(width: 75, height: 100)
                }
                Spacer()
            }
            VStack(alignment: .leading){
                Text(currentMovie.title).font(.caption)
                if let release_date = currentMovie.release_date {
                    Text(release_date.prefix(4)).foregroundColor(.gray).font(.caption2)
                }
                Spacer()
            } .padding(.top)
            Spacer()
        }
    }
}

struct SearchRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchRow(currentMovie: IndividualMovieResponse())
    }
}
