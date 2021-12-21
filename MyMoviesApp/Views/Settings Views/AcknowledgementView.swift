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
            Form {
                Section(header: Text("Data and Images")) {
                    VStack {
                        Text("All data and images used in MyMoviesApp has been provided by The Movie Database and TMDB API. Credit for all movie poster images, backdrop images, actor images, and all movie data is credited to TMDB. Find out more at www.tmdb.org")
                        HStack {
                            Image("moviedb_logo").resizable().frame(width: 50, height: 50)
                            Spacer()
                        }
                    }
                    
                    VStack {
                        Text("All Information About Showtimes and Where to Watch is Provided by JustWatch though TMDB API. Find out more at www.justwatch.com")
                    }
                }
                
                
                Section(header: Text("Logo")) {
                    Text("App Icons were made by https://www.freepik.com from https://www.flaticon.com/. Check out their pages for more information as well as other icons and logos.")
                }
            }
        }
    }
}

struct AcknowledgementView_Previews: PreviewProvider {
    static var previews: some View {
        AcknowledgementView()
    }
}
