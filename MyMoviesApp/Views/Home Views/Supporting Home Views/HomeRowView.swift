//
//  HomeRowView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 12/3/21.
//

import SwiftUI
import Kingfisher

struct HomeRowView: View {
    
    var movieId: Int
    var movieName : String
    var moviePosterPath : String
    var isFromCollection : Bool
    
    let baseUrl = "https://image.tmdb.org/t/p/w500/"
    
    let rowHeight : CGFloat
    
    var body: some View {
        VStack {
            if(isFromCollection) {
                KFImage(URL(string: "\(moviePosterPath)")).resizable()
            }
            else {
                KFImage(URL(string: "\(baseUrl)\(moviePosterPath)")).resizable()
            }
        }.frame(height: rowHeight).background(Color.blue).border(Color.gray)
    }
}

struct HomeRowView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRowView(movieId: -1, movieName: "", moviePosterPath: "", isFromCollection: false, rowHeight: 0)
    }
}
