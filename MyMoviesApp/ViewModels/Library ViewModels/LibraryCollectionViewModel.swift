//
//  LibraryCollectionViewModel.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/17/21.
//

import Foundation
import CoreData

class LibraryCollectionViewModel : ObservableObject {
    @Published var storedMovies : [StoredMovie]
    
    init() {
        storedMovies = []
        getAllMoviesDate()
    }
    
    func getAllMoviesDate() {
        storedMovies.removeAll()
        storedMovies = CoreDataManager.shared.getAllMoviesDate()
    }
    
    func getAllMoviesRating() {
        storedMovies.removeAll()
        storedMovies = CoreDataManager.shared.getAllMoviesRating()
    }
    
    func getAllMoviesDirector() {
        storedMovies.removeAll()
        storedMovies = CoreDataManager.shared.getAllMoviesDirector()
    }
    
    func getAllMoviesReleased() {
        storedMovies.removeAll()
        storedMovies = CoreDataManager.shared.getAllMoviesReleased()
    }
    
    func getAllMoviesTitle() {
        storedMovies.removeAll()
        storedMovies = CoreDataManager.shared.getAllMoviesName()
    }
    
    func getAllMoviesWatched() {
        storedMovies.removeAll()
        storedMovies = CoreDataManager.shared.getAllMoviesWatched()
    }
    
    func getAllMoviesUnwatched() {
        storedMovies.removeAll()
        storedMovies = CoreDataManager.shared.getAllMoviesUnwatched()
    }
    
}
