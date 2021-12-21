//
//  HomeNowPlayingView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/14/21.
//

import SwiftUI
import Kingfisher

struct HomeNowPlayingView: View {
    
    @StateObject private var nowPlayingViewModel = NowPlayingViewModel()
    
    let columns = [GridItem(.flexible(minimum: 80), spacing: 6), GridItem(.flexible(minimum: 80), spacing: 6), GridItem(.flexible(minimum: 80), spacing: 6)]
    
    let rowHeight = (UIScreen.screenHeight/4 - 25)

    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(nowPlayingViewModel.moviesNowPlaying, id: \.self) { movie in
                    if let poster_path = movie.poster_path {
                        NavigationLink(destination: MovieDetailsView(currentMovie: movie.id)) {
                            HomeRowView(movieId: movie.id, movieName: movie.title, moviePosterPath: poster_path, isFromCollection: false ,rowHeight: rowHeight)
                        }.onAppear() {
                            if(movie == nowPlayingViewModel.moviesNowPlaying.last) {
                                Task {
                                    await nowPlayingViewModel.getMoviesLoader() 
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

struct HomeNowPlayingView_Previews: PreviewProvider {
    static var previews: some View {
        HomeNowPlayingView()
    }
}
