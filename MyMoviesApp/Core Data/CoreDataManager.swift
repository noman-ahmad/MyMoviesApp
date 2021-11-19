//
//  CoreDataManager.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/17/21.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer : NSPersistentContainer
    static let shared = CoreDataManager()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    
    func getMovieEntity(movieId : Int) -> [StoredMovie] {
        let fetchRequest: NSFetchRequest<StoredMovie>
        fetchRequest = StoredMovie.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let predicate = NSPredicate(format: "id == %i", movieId)
        fetchRequest.predicate = predicate
        
        do {
            let context = CoreDataManager.shared.viewContext
            
            let movieFound = try context.fetch(fetchRequest)
            for all in movieFound {
                print(all.id)
            }
            return movieFound
        } catch {
            print("Error with Fetch Request \(error)")
            return []
        }
    }
    
    func getAllMovies() -> [StoredMovie] {
        let fetchRequest: NSFetchRequest<StoredMovie>
        fetchRequest = StoredMovie.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        
        do {
            let context = CoreDataManager.shared.viewContext
            
            let movieFound = try context.fetch(fetchRequest)
            for all in movieFound {
                print(all.id)
            }
            return movieFound
        } catch {
            print("Error with Fetch Request \(error)")
            return []
        }
    }
    
    func updateMovie(movieId: Int, movieRating: Float, movieReview: String, movieWatched: Bool) {
        let fetchRequest: NSFetchRequest<StoredMovie>
        fetchRequest = StoredMovie.fetchRequest()
        fetchRequest.fetchLimit = 1
        
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let predicate = NSPredicate(format: "id == %i", movieId)
        fetchRequest.predicate = predicate
        
        do {
            let context = CoreDataManager.shared.viewContext
            
            let movieFound = try context.fetch(fetchRequest).first
            
            movieFound!.watch_status = movieWatched
            movieFound!.review = movieReview
            movieFound!.rating = movieRating
            
            print("updated successfully")
            save()
            
            
        } catch {
            print("Couldn't Update")
        }
        
        
    }
    
    func deleteMovie(movieId: Int) {
        let fetchRequest: NSFetchRequest<StoredMovie>
        fetchRequest = StoredMovie.fetchRequest()
        fetchRequest.fetchLimit = 1
        
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let predicate = NSPredicate(format: "id == %i", movieId)
        fetchRequest.predicate = predicate
        do {
            let context = CoreDataManager.shared.viewContext
            
            guard let movieFound = try context.fetch(fetchRequest).first else { return  }
            
            context.delete(movieFound)
            save()
            print("Successfully Deleted")
        } catch {
            print("Couldn't Delete")
        }
    }
    
    
    
    
    func getAllMoviesUnwatched() -> [StoredMovie] {
        let fetchRequest: NSFetchRequest<StoredMovie>
        fetchRequest = StoredMovie.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let predicate = NSPredicate(format: "watch_status == %d", false)
        fetchRequest.predicate = predicate
        
        do {
            let context = CoreDataManager.shared.viewContext
            
            let movieFound = try context.fetch(fetchRequest)
            for all in movieFound {
                print(all.id)
            }
            return movieFound
        } catch {
            print("Error with Fetch Request \(error)")
            return []
        }
    }
    
    func getAllMoviesWatched() -> [StoredMovie] {
        let fetchRequest: NSFetchRequest<StoredMovie>
        fetchRequest = StoredMovie.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key: "rating", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let predicate = NSPredicate(format: "watch_status == %d", true)
        fetchRequest.predicate = predicate
        
        do {
            let context = CoreDataManager.shared.viewContext
            
            let movieFound = try context.fetch(fetchRequest)
            for all in movieFound {
                print(all.id)
            }
            return movieFound
        } catch {
            print("Error with Fetch Request \(error)")
            return []
        }
    }
    
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "MyMoviesApp")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data Stack \(error)")
            }
        }
    }
}
