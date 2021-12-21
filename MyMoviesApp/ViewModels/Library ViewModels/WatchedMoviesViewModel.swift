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
    
    func getAverage() -> Float {
        if storedMovies.count == 0 {
            return 0.0
        } else {
            var total : Float = 0.0
            for movie in storedMovies {
                total = total + movie.rating
            }
            total = total / Float(storedMovies.count)
            return total
        }
    }
}

