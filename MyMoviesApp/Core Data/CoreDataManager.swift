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
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "MyMoviesApp")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data Stack \(error)")
            }
        }
    }
}
