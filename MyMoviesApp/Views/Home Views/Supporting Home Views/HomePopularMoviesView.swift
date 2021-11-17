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
    let columns = [GridItem(.adaptive(minimum: 120))]
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(popularMoviesViewModel.getPopularMovies(), id: \.id) {
                    movie in
                    if let poster_path = movie.poster_path {
                        let url = "https://image.tmdb.org/t/p/w500/\(poster_path)"
                        NavigationLink(destination: MovieDetailsView(currentMovie: movie.id)){
                            KFImage(URL(string: url)).resizable().frame(width: 120, height: 150).border(Color.gray)
                                .onAppear {
                                    if (movie == popularMoviesViewModel.getPopularMovies().last) {
                                        Task {
                                            await popularMoviesViewModel.getMoviesLoader()
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
                                    if (movie == popularMoviesViewModel.getPopularMovies().last) {
                                        Task {
                                            await popularMoviesViewModel.getMoviesLoader()
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

struct HomePopularMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        HomePopularMoviesView()
    }
}
