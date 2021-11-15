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
        
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text("Cast").font(.headline).fontWeight(.bold)
                Spacer()
                NavigationLink(destination: Text("Hello")) {
                    Text("All")
                }
            }
            ScrollView(.horizontal) {
                HStack(alignment: .top) {
                    ForEach(movieCast, id: \.id) {
                        cast in
                        VStack(spacing: 3) {
                            if let profile_path = cast.profile_path {
                                let url = "https://image.tmdb.org/t/p/w200/\(profile_path)"
                                KFImage(URL(string: url)).resizable().frame(width: 90, height: 110)
                            } else {
                                Image("actor-placeholder").resizable().frame(width: 90, height: 110)
                            }
                            HStack {
                                Spacer()
                                Text(cast.name).font(.caption2)
                                Spacer()
                            }.frame(width: 110)
                        }
                    }
                }
            }
        }.padding()
    }
}

struct MovieCastRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieCastRow(movieCast: [])
    }
}
