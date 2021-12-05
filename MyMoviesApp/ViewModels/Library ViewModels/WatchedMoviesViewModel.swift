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
    
    func sortRating() {
        storedMovies.removeAll()
        getAllMoviesWatched()
    }
    
    func sortName() {
        storedMovies.removeAll()
        storedMovies = CoreDataManager.shared.getAllMoviesWatchedTitle()
    }
    
    func sortDate() {
        storedMovies.removeAll()
        storedMovies = CoreDataManager.shared.getAllMoviesWatchedDate()
    }
    
    func sortReleased() {
        storedMovies.removeAll()
        storedMovies = CoreDataManager.shared.getAllMoviesWatchedReleased()
    }
    
    func sortDirector() {
        storedMovies.removeAll()
        storedMovies = CoreDataManager.shared.getAllMoviesWatchedDirector()
    }
}

