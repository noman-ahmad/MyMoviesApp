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
        HStack(alignment: .top, spacing: 10) {
            if let poster_path = currentMovie.poster_path {
                let url = "https://image.tmdb.org/t/p/original/" + poster_path
                CachedAsyncImage(url: URL(string: url)) {
                    image in image
                        .resizable()
                } placeholder: {
                    ProgressView()
                }.aspectRatio(contentMode: .fill).frame(width: 75, height: 75).background(Color.gray)
                    .padding(.top).padding(.leading).padding(.bottom)
            } else {
                Image("placeholder-poster").resizable().aspectRatio(contentMode: .fill).frame(width: 75, height: 75).padding(.top).padding(.leading).padding(.bottom)
            }
            VStack(alignment: .leading, spacing: 5) {
                Text(currentMovie.original_title).font(.caption)
                Text(currentMovie.release_date.prefix(4)).foregroundColor(.gray).font(.caption2)
            }
        }.padding(.top)
    }
}

struct SearchRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchRow(currentMovie: IndividualMovieResponse(poster_path: "", adult: false, overview: "", release_date: "", genre_ids: [], id: 1, original_title: "", original_language: "", title: "", backdrop_path: "", popularity: 10, vote_count: 1, video: true, vote_average: 0.1))
    }
}
