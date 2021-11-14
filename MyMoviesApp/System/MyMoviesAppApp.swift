//
//  MyMoviesAppApp.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/2/21.
//

import SwiftUI

@main
struct MyMoviesAppApp: App {
    
    let persistenceContainer = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            InitialView().environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}
