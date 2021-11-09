//
//  Persistence.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/7/21.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "MyMoviesApp")
        container.loadPersistentStores {(storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unsolvable Error: \(error)")
            }
        }
    }
}
