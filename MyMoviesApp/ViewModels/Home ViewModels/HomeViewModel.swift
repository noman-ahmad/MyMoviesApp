//
//  HomeViewModel.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/14/21.
//

import Foundation

class HomeViewModel : ObservableObject {
    @Published private var moviesNowPlaying : [IndividualMovieResponse]
    @Published private var moviesUpcoming : [IndividualMovieResponse]
    @Published private var moviesTopRated : [IndividualMovieResponse]
    @Published private var moviesPopular : [IndividualMovieResponse]
    
    enum HomeViewModelError : Error {
        case invalidUrl
        case missingData
    }
    
    
    init() {
        self.moviesNowPlaying = []
        self.moviesUpcoming = []
        self.moviesTopRated = []
        self.moviesPopular = []
    }
    
    
    
}
