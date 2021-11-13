//
//  OneRating.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/12/21.
//

import SwiftUI

struct OneRating: View {
    var body: some View {
        HStack {
            Image(systemName: "star.fill").resizable().frame(width: 10, height: 10)
            Image(systemName: "star").resizable().frame(width: 10, height: 10)
            Image(systemName: "star").resizable().frame(width: 10, height: 10)
            Image(systemName: "star").resizable().frame(width: 10, height: 10)
            Image(systemName: "star").resizable().frame(width: 10, height: 10)
        }
    }
}

struct OneRating_Previews: PreviewProvider {
    static var previews: some View {
        OneRating()
    }
}
