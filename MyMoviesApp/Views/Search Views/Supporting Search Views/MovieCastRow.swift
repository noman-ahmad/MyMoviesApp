//
//  MovieCastRow.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/12/21.
//

import SwiftUI
import Kingfisher

struct MovieCastRow: View {
    
    var movieCast : [CastResponse]
    
    var body: some View {
        
        if (movieCast.count != 0) {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text("Cast").font(.headline).fontWeight(.bold)
                    Spacer()
                }
                ScrollView(.horizontal) {
                    HStack(alignment: .top) {
                        ForEach(movieCast, id: \.id) {
                            cast in
                            VStack(spacing: 3) {
                                if let profile_path = cast.profile_path {
                                    let url = "https://image.tmdb.org/t/p/w200/\(profile_path)"
                                    KFImage(URL(string: url)).resizable().frame(width: 90, height: 125).border(Color.gray)
                                } else {
                                    Image("actor-placeholder").resizable().frame(width: 90, height: 125)
                                }
                                HStack {
                                    Text(cast.name).font(.caption2).foregroundColor(Color.secondary).lineLimit(2)
                                    Spacer()
                                }.frame(width: 90)
                            }
                        }
                    }
                }
            }.padding(.leading).padding(.trailing)
        }
    }
}

struct MovieCastRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieCastRow(movieCast: [])
    }
}
