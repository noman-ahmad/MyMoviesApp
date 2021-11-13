//
//  FourFiveRating.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/12/21.
//

import SwiftUI

struct FourFiveRating: View {
    var body: some View {
        HStack {
            Image(systemName: "star.fill").resizable().frame(width: 10, height: 10)
            Image(systemName: "star.fill").resizable().frame(width: 10, height: 10)
            Image(systemName: "star.fill").resizable().frame(width: 10, height: 10)
            Image(systemName: "star.fill").resizable().frame(width: 10, height: 10)
            Image(systemName: "star.lefthalf.fill").resizable().frame(width: 10, height: 10)
        }
    }
}

struct FourFiveRating_Previews: PreviewProvider {
    static var previews: some View {
        FourFiveRating()
    }
}
