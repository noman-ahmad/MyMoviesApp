//
//  LibraryWatchedRow.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/18/21.
//

import SwiftUI
import Kingfisher

struct LibraryWatchedRow: View {
    
    var image_url : String
    var movieTitle : String
    var movieRating : Float
    
    
    var body: some View {
        HStack {
            VStack {
                Spacer()
                if image_url != "" {
                    KFImage(URL(string: image_url)).resizable().frame(width: 75, height: 100).background(Color.gray).border(Color.gray)
                } else {
                    Image("placeholder-poster").resizable().frame(width: 75, height: 100).background(Color.gray).border(Color.gray)
                }
                Spacer()
            }
            
            VStack(alignment: .leading) {
                Text(movieTitle).font(.caption)
                HStack {
                    Image(systemName: "star.fill").resizable().frame(width: 10, height: 10)
                    Text(String(movieRating)).font(.caption2)
                }
                Spacer()
            }.frame(height: 100)
        }

    }
}

struct LibraryWatchedRow_Previews: PreviewProvider {
    static var previews: some View {
        LibraryWatchedRow(image_url: "", movieTitle: "", movieRating: -1)
    }
}
