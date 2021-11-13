//
//  MovieSynopsisRow.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/12/21.
//

import SwiftUI


struct MovieSynopsisRow: View {
    
    var movieDescription : String
    
    var body: some View {
        if movieDescription != "" {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text("Synopsis").font(.headline).fontWeight(.bold)
                    Spacer()
                }
                HStack {
                    Text(movieDescription).font(.caption).foregroundColor(Color.secondary)
                }
            }.padding()
        }
    }
}

struct MovieSynopsisRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieSynopsisRow(movieDescription: "")
    }
}
