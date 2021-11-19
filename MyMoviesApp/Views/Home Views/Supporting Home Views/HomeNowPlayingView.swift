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
    
    let columns = [GridItem(.adaptive(minimum: 80, maximum: 120))]

    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(nowPlayingViewModel.getMoviesNowPlaying(), id: \.id) {
                    movie in
                    if let poster_path = movie.poster_path {
                        let url = "https://image.tmdb.org/t/p/w500/\(poster_path)"
                        NavigationLink(destination: MovieDetailsView(currentMovie: movie.id)) {
                            KFImage(URL(string: url)).resizable().frame(width: 120, height: 150).border(Color.gray)
                                .onAppear {
                                    if (movie == nowPlayingViewModel.getMoviesNowPlaying().last) {
                                        Task {
                                            await nowPlayingViewModel.getMoviesLoader()
                                        }
                                }
                            }
                        }
                    } else {
                        NavigationLink(destination: MovieDetailsView(currentMovie: movie.id)){
                            VStack {
                                Spacer()
                                Text(movie.title).foregroundColor(.primary)
                                Spacer()
                            }.frame(width: 120, height: 150).border(Color.gray).background(Color.gray)
                                .onAppear {
                                    if (movie == nowPlayingViewModel.getMoviesNowPlaying().last) {
                                        Task {
                                            await nowPlayingViewModel.getMoviesLoader()
                                        }
                                    }
                            }
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
