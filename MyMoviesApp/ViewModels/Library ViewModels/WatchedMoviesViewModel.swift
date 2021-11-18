//
//  WatchedMoviesViewModel.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/17/21.
//

import Foundation
import CoreData

class WatchedMoviesViewModel : ObservableObject {
    @Published var storedMovies : [StoredMovie]
    
    init() {
        storedMovies = []
        getAllMoviesWatched()
    }
    
    func getAllMoviesWatched() {
        storedMovies = CoreDataManager.shared.getAllMoviesWatched()
    }
    
}

