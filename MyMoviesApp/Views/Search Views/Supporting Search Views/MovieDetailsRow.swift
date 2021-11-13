//
//  MovieDetailsRow.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/12/21.
//

import SwiftUI

struct MovieDetailsRow: View {
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("Released").font(.subheadline).fontWeight(.bold)
                Text("1999").font(.caption)
            }
            Spacer()
            VStack(alignment: .leading) {
                Text("Runtime").font(.subheadline).fontWeight(.bold)
                Text("2hr45min").font(.caption)
            }
            Spacer()
            VStack(alignment: .leading) {
                Text("Genre").font(.subheadline).fontWeight(.bold)
                Text("Drama").font(.caption)
            }
        }.padding()
    }
}

struct MovieDetailsRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsRow()
    }
}
