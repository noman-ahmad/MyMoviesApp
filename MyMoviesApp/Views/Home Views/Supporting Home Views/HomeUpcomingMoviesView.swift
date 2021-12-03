//
//  HomeUpcomingMoviesView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/14/21.
//

import SwiftUI
import Kingfisher

struct HomeUpcomingMoviesView: View {
    
    @StateObject private var upcomingMoviesViewModel = UpcomingViewModel()
    let columns = [GridItem(.flexible(minimum: 80), spacing: 6), GridItem(.flexible(minimum: 80), spacing: 6), GridItem(.flexible(minimum: 80), spacing: 6)]
    
    let rowHeight = (UIScreen.screenHeight/4 - 25)
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(upcomingMoviesViewModel.upcomingMovies, id: \.self) { movie in
                    if let poster_path = movie.poster_path {
                        NavigationLink(destination: MovieDetailsView(currentMovie: movie.id)) {
                            HomeRowView(movieId: movie.id, movieName: movie.title, moviePosterPath: poster_path, isFromCollection: false ,rowHeight: rowHeight)
                        }.onAppear() {
                            if(movie == upcomingMoviesViewModel.upcomingMovies.last) {
                                Task {
                                    await upcomingMoviesViewModel.getMoviesLoader()
                                }
                            }
                        }
                    }
                    else {
                        NavigationLink(destination: MovieDetailsView(currentMovie: movie.id)) {
                            HomeEmptyRowView(movieTitle: movie.title, rowHeight: rowHeight).frame(height: rowHeight)
                        }
                    }
                }
            }
        }.padding(.leading).padding(.trailing)
    }
}

struct HomeUpcomingMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUpcomingMoviesView()
    }
}
