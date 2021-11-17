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
        getAllMoviesUnwatched()
    }
    
    func getAllMoviesUnwatched() {
        storedMovies = CoreDataManager.shared.getAllMoviesUnwatched()
    }
    
}
