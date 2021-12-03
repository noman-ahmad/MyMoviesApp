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
    let columns = [GridItem(.flexible(minimum: 80), spacing: 6), GridItem(.flexible(minimum: 80), spacing: 6), GridItem(.flexible(minimum: 80), spacing: 6), GridItem(.flexible(minimum: 80), spacing: 6)]
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(upcomingMoviesViewModel.getUpcomingMovies(), id: \.id) {
                    movie in
                    if let poster_path = movie.poster_path {
                        let url = "https://image.tmdb.org/t/p/w500/\(poster_path)"
                        NavigationLink(destination: MovieDetailsView(currentMovie: movie.id)){
                            KFImage(URL(string: url)).resizable().frame(maxHeight: (UIScreen.screenHeight/5 - 25)).border(Color.gray)
                                .onAppear {
                                    if (movie == upcomingMoviesViewModel.getUpcomingMovies().last) {
                                        Task {
                                            await upcomingMoviesViewModel.getMoviesLoader()
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
                                    if (movie == upcomingMoviesViewModel.getUpcomingMovies().last) {
                                        Task {
                                            await upcomingMoviesViewModel.getMoviesLoader()
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

struct HomeUpcomingMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUpcomingMoviesView()
    }
}
