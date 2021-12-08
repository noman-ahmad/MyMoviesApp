//
//  UnwatchedMoviesViewModel.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/17/21.
//

import Foundation
import CoreData

class UnwatchedMoviesViewModel : ObservableObject {
    @Published var storedMovies : [StoredMovie]
    
    init() {
        storedMovies = []
        getAllMoviesUnwatchedName()
    }
    
    func getAllMoviesUnwatchedName() {
        storedMovies.removeAll()
        storedMovies = CoreDataManager.shared.getAllMoviesUnwatchedTitle()
    }
    
    func getAllMoviesUnwatchedDate() {
        storedMovies.removeAll()
        storedMovies = CoreDataManager.shared.getAllMoviesUnwatchedDate()
    }
    
    func getAllMoviesUnwatchedReleased() {
        storedMovies.removeAll()
        storedMovies = CoreDataManager.shared.getAllMoviesUnwatchedReleased()
    }
    
    func getAllMoviesUnwatchedDirector() {
        storedMovies.removeAll()
        storedMovies = CoreDataManager.shared.getAllMoviesUnwatchedDirector()
    }
    
}
