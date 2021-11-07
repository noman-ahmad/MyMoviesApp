//
//  HomeView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/2/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var popularMovies = [IndividualMovieResponse()]
    @State private var moviesPlaying = [IndividualMovieResponse()]
    @State private var topRatedMovies = [IndividualMovieResponse()]
    @State private var upcomingMovies = [IndividualMovieResponse()]
        
    
    var body: some View {
        
        NavigationView {
                List {
                    
                    Section("Popular Movies") {
                        HomePopularMoviesView(popularMovies: popularMovies)
                    }
                    Section("Top Rated Movies") {
                        HomePopularMoviesView(popularMovies: topRatedMovies)
                    }
                    Section("Upcoming Movies") {
                        HomePopularMoviesView(popularMovies: upcomingMovies)
                    }
                    Section("Now Playing") {
                        HomePopularMoviesView(popularMovies: moviesPlaying)
                    }
                }.id(UUID()).listStyle(GroupedListStyle())
                    .navigationBarTitleDisplayMode(.automatic)
                    .navigationBarTitle("MyMoviesApp")
                .onAppear() {
                    Task {
                        print("Getting Popular Movies")
                        popularMovies = await requestManager.getPopularMoviesLoader()
                    }
                    Task {
                        print("Getting Movies Now Playing")
                        moviesPlaying = await requestManager.getMoviesNowPlayingLoader()
                    }
                    Task {
                        print("Getting Top Rated Movies")
                        topRatedMovies = await requestManager.getTopRatedMoviesLoader()
                    }
                    Task {
                        print("Get Movies Upcoming")
                        upcomingMovies = await requestManager.getMoviesUpcomingLoader()
                    }
                }
    }
}
    
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
