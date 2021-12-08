//
//  LibraryCollectionsView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/13/21.
//

import SwiftUI
import Kingfisher
import CoreData

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct LibraryCollectionsView: View {
    
    @StateObject private var collectionViewModel = LibraryCollectionViewModel()
    
    let columns = [GridItem(.flexible(minimum: 80), spacing: 6), GridItem(.flexible(minimum: 80), spacing: 6), GridItem(.flexible(minimum: 80), spacing: 6)]
    
    let rowHeight = (UIScreen.screenHeight/4 - 25)
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(collectionViewModel.storedMovies, id:\.id) { movie in
                        NavigationLink(destination: MovieDetailsView(currentMovie: Int(movie.id))) {
                            if let title = movie.title {
                                if let poster_path = movie.image_path {
                                    if poster_path != "" {
                                        HomeRowView(movieId: Int(movie.id), movieName: title, moviePosterPath: poster_path, isFromCollection: true, rowHeight: rowHeight)
                                    } else {
                                        HomeEmptyRowView(movieTitle: title, rowHeight: rowHeight)
                                    }
                                }
                                else {
                                    
                                }
                            }
                            else {
                                // If Not title, what to do here?
                            }
                        }
                    }
                }
            }
            .padding(.leading)
            .padding(.trailing)
            .onAppear() {
                collectionViewModel.getAllMovies()
        }
    }
        
}

struct LibraryCollectionsView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryCollectionsView()
    }
}
