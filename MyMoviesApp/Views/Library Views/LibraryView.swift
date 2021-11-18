//
//  LibraryView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/2/21.
//

import SwiftUI
import CoreData

struct LibraryView: View {
//    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(entity: StoredMovie.entity(), sortDescriptors: []) var movies : FetchedResults<StoredMovie>
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
                      WatchedMoviesCollectionView()
                    } else if currentViewState == 1 {
                        UnwatchedMovieRow().ignoresSafeArea()
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
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
