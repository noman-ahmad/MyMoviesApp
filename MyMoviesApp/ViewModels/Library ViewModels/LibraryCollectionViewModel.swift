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
        getAllMovies()
    }
    
    func getAllMovies() {
        storedMovies = CoreDataManager.shared.getAllMovies()
    }
    
    
}
