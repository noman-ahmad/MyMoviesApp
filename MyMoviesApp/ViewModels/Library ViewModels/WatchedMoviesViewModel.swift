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
        storedMovies.sort {
            $0.rating < $1.rating
        }
    }
    
    func sortName() {
        storedMovies.sort {
            $0.title! < $1.title!
        }
    }
    
    func sortDate() {
        storedMovies.sort {
            $0.date_updated! < $1.date_updated!
        }
    }
}

