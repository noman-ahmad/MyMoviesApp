//
//  LibraryView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/2/21.
//

import SwiftUI
import CoreData

struct LibraryView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: StoredMovie.entity(), sortDescriptors: []) var movies : FetchedResults<StoredMovie>
    @State private var currentViewState = 0
    
    
//    init(){
//        let appearance = UINavigationBarAppearance()
//        appearance.configureWithOpaqueBackground()
//
//        UINavigationBar.appearance().standardAppearance = appearance
//        UINavigationBar.appearance().compactAppearance = appearance
//        UINavigationBar.appearance().scrollEdgeAppearance = appearance
//
//        UINavigationBar.appearance().tintColor = .white
//    }
//
    var body: some View {
        
        
        ZStack {
            NavigationView {
                
                VStack {
                    
                    HStack {
                        Picker("Choose State", selection: $currentViewState) {
                            Text("Watched").tag(0)
                            Text("Unwatched").tag(1)
                            Text("Collection").tag(2)
                        }.pickerStyle(.segmented)
                    }.frame(width: 300).padding(.top, 3)
                    
                    if currentViewState == 0 {
                        List {
                            Text("1")
                            Text("2")
                            Text("3")
                        }
                    } else if currentViewState == 1 {
                        UnwatchedMovieRow()
                    } else {
                        LibraryCollectionsView()
                    }
                }.navigationTitle("My Movies App")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                       

                    }
        }

            
        }
    }
    
    func removeMovie(at offsets: IndexSet) {
        for index in offsets {
            let movie = movies[index]
            moc.delete(movie)
        }
        do {
            try moc.save()
        } catch {
            print("couldnt save context")
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
