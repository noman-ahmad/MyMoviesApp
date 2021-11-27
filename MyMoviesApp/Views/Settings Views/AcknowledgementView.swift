//
//  AcknowledgementView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/18/21.
//

import SwiftUI


struct AcknowledgementView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("All data and images used in MyMoviesApp has been provided by The Movie Database and TMDB API. Credit for all movie poster images, backdrop images, actor images, as well as all movie data is credited to TMDB. Find out more about TMDB at www.tmdb.org")
                Image("moviedb_logo").resizable().frame(width: 50, height: 50)
            }
        }
    }
}

struct AcknowledgementView_Previews: PreviewProvider {
    static var previews: some View {
        AcknowledgementView()
    }
}