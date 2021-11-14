//
//  Persistence.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/2/21.
//

import CoreData


struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "MyMoviesApp")
        
        container.loadPersistentStores {
            (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unreslved error: \(error)")
            }
        }
    }
}
