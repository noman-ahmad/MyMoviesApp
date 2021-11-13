//
//  FourRating.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/12/21.
//

import SwiftUI

struct FourRating: View {
    var body: some View {
        HStack {
            Image(systemName: "star.fill").resizable().frame(width: 10, height: 10)
            Image(systemName: "star.fill").resizable().frame(width: 10, height: 10)
            Image(systemName: "star.fill").resizable().frame(width: 10, height: 10)
            Image(systemName: "star.fill").resizable().frame(width: 10, height: 10)
            Image(systemName: "star").resizable().frame(width: 10, height: 10)
        }
    }
}

struct FourRating_Previews: PreviewProvider {
    static var previews: some View {
        FourRating()
    }
}
