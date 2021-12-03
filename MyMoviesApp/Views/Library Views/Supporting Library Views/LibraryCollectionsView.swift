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
    
    let columns = [GridItem(.flexible(minimum: 80), spacing: 6), GridItem(.flexible(minimum: 80), spacing: 6), GridItem(.flexible(minimum: 80), spacing: 6), GridItem(.flexible(minimum: 80), spacing: 6)]
    
    var body: some View {
        
        
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(collectionViewModel.storedMovies, id:\.id) { movie in
                    NavigationLink(destination: MovieDetailsView(currentMovie: Int(movie.id))) {
                        KFImage(URL(string: movie.image_path!)).resizable().border(Color.gray).frame(maxHeight: (UIScreen.screenHeight/5 - 25))
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
