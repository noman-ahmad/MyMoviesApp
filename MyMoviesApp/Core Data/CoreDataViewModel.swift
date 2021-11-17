////
////  CoreDataViewModel.swift
////  MyMoviesApp
////
////  Created by Noman Ahmad on 11/16/21.
////
//
//import Foundation
//import CoreData
//
//class CoreDataViewModel: ObservableObject {
//    static let shared = CoreDataViewModel()
//    
//    let container: NSPersistentContainer
//    let context: NSManagedObjectContext
//    @Published var savedEntities: [StoredMovie] = []
//    
//    init() {
//        container = NSPersistentContainer(name: "MyMoviesApp")
//        container.loadPersistentStores { (description ,error) in
//            if let error = error {
//                print("Error Loading Core Data \(error)")
//            } else {
//                print("Successfully Loaded Core Data")
//            }
//        }
//        context = container.viewContext
//        fetchMovies()
//    }
//    
//    func fetchMovies() {
//        let request = NSFetchRequest<StoredMovie>(entityName: "StoredMovie")
//        
//        do {
//            savedEntities = try context.fetch(request)
//        } catch let error {
//            print("Error fetching core data \(error)")
//        }
//    }
//    
//    func addMovie(movieId: Int, movieName: String, movieImage: String) {
//        let newMovie = StoredMovie(context: container.viewContext)
//        newMovie.id = Int64(movieId)
//        newMovie.title = movieName
//        newMovie.image_path = movieImage
//        saveData()
//    }
//    
//    func saveData() {
//        do {
//            try container.viewContext.save()
//            fetchMovies()
//        } catch let error {
//            print("Error Saving. \(error)")
//        }
//    }
//    
//    
//    func removeMovie(at offsets: IndexSet) {
//        for index in offsets {
//            let movie = savedEntities[index]
//            container.viewContext.delete(movie)
//        }
//        saveData()
//    }
//    
//    func getAllMovies() -> [StoredMovie] {
//        return savedEntities
//    }
//    
//    
//    
//    
//}
