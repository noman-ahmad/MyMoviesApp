//
//  MovieImageDescriptionView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/3/21.
//

import SwiftUI
import Kingfisher

struct MovieImageDescriptionView: View {

    var moviePosterPath : String
    
    var movieRating : String
    
    var movieGenres : String
    
    var movieYear : String
    
    var movieRuntime : String
    
    var movieDirector : String
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                        if moviePosterPath != "" {
                            KFImage(URL(string: moviePosterPath)).resizable().frame(width: 200, height: 300).border(Color.gray)
                        } else {
                            Image("placeholder-poster").resizable().frame(width: 200, height: 300).border(Color.gray)
                        }
                    if (movieRating == "ZeroRating") {

                    }else if (movieRating == "ZeroFiverating") {
                        ZeroFiveRating().padding(.top)
                    } else if (movieRating == "OneRating") {
                        OneRating().padding(.top)
                    } else if (movieRating == "OneFiveRating") {
                        OneFiveRating().padding(.top)
                    } else if (movieRating == "TwoRating") {
                        TwoRating().padding(.top)
                    } else if (movieRating == "TwoFiveRating") {
                        TwoFiveRating().padding(.top)
                    } else if (movieRating == "ThreeRating") {
                        ThreeRating().padding(.top)
                    } else if (movieRating == "ThreeFiveRating") {
                        ThreeFiveRating().padding(.top)
                    } else if (movieRating == "FourRating") {
                        FourRating().padding(.top)
                    } else if (movieRating == "FourFiveRating") {
                        FourFiveRating().padding(.top)
                    } else {
                        FiveRating().padding(.top)
                    }
                    Spacer()
                    
                    HStack {
                        if movieDirector != "" {
                            Text(movieDirector).font(.caption2).foregroundColor(.secondary)
                        }
                    }
                    HStack {
                        
                        let hasYear = (movieYear != "")
                        let hasRuntime = (movieRuntime != "")
                        let hasGenres = (movieGenres != "" )
                        
                        if(hasYear && hasRuntime && hasGenres) {
                            Text(movieYear).font(.caption2).foregroundColor(.secondary)
                            Text("\u{2022}")
                            Text(movieRuntime).font(.caption2).foregroundColor(.secondary)
                            Text("\u{2022}")
                            Text(movieGenres).font(.caption2).foregroundColor(.secondary)
                        } else if (hasYear && hasRuntime) {
                            Text(movieYear).font(.caption2).foregroundColor(.secondary)
                            Text("\u{2022}")
                            Text(movieRuntime).font(.caption2).foregroundColor(.secondary)
                        } else if(hasYear && hasGenres) {
                            Text(movieYear).font(.caption2).foregroundColor(.secondary)
                            Text("\u{2022}")
                            Text(movieGenres).font(.caption2).foregroundColor(.secondary)
                        } else if(hasRuntime && hasGenres) {
                            Text(movieRuntime).font(.caption2).foregroundColor(.secondary)
                            Text("\u{2022}")
                            Text(movieGenres).font(.caption2).foregroundColor(.secondary)
                        } else if (hasYear) {
                            Text(movieYear).font(.caption2).foregroundColor(.secondary)
                        } else if (hasRuntime) {
                            Text(movieRuntime).font(.caption2).foregroundColor(.secondary)
                        } else if(hasGenres) {
                            Text(movieGenres).font(.caption2).foregroundColor(.secondary)
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct MovieImageDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        MovieImageDescriptionView(moviePosterPath: "", movieRating: "", movieGenres: "", movieYear: "", movieRuntime: "", movieDirector: "")
    }
}
