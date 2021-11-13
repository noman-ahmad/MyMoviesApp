//
//  zeroRating.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/12/21.
//

import SwiftUI

struct ZeroRating: View {
    var body: some View {
        HStack {
            Image(systemName: "star").resizable().frame(width: 10, height: 10)
            Image(systemName: "star").resizable().frame(width: 10, height: 10)
            Image(systemName: "star").resizable().frame(width: 10, height: 10)
            Image(systemName: "star").resizable().frame(width: 10, height: 10)
            Image(systemName: "star").resizable().frame(width: 10, height: 10)
        }
    }
}

struct ZeroRating_Previews: PreviewProvider {
    static var previews: some View {
        ZeroRating()
    }
}
