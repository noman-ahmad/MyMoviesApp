//
//  HomePopularMoviesView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/7/21.
//

import SwiftUI
import Kingfisher

struct HomePopularMoviesView: View {
    
    @StateObject private var popularMoviesViewModel = PopularViewModel()
    let columns = [GridItem(.flexible(minimum: 80), spacing: 6), GridItem(.flexible(minimum: 80), spacing: 6), GridItem(.flexible(minimum: 80), spacing: 6)]
    
    let rowHeight = (UIScreen.screenHeight/4 - 25)
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(popularMoviesViewModel.popularMovies, id: \.self) { movie in
                    if let poster_path = movie.poster_path {
                        NavigationLink(destination: MovieDetailsView(currentMovie: movie.id)) {
                            HomeRowView(movieId: movie.id, movieName: movie.title, moviePosterPath: poster_path, isFromCollection: false ,rowHeight: rowHeight)
                        }.onAppear() {
                            if(movie == popularMoviesViewModel.popularMovies.last) {
                                Task {
                                    await popularMoviesViewModel.getMoviesLoader()
                                }
                            }
                        }
                    }
                    else {
                        NavigationLink(destination: MovieDetailsView(currentMovie: movie.id)) {
                            HomeEmptyRowView(movieTitle: movie.title, rowHeight: rowHeight)
                        }
                    }
                }
            }
        }.padding(.leading).padding(.trailing)
    }
}

struct HomePopularMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        HomePopularMoviesView()
    }
}
