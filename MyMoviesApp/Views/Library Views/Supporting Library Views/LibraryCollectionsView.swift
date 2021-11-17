//
//  LibraryCollectionsView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/13/21.
//

import SwiftUI
import Kingfisher
import CoreData

struct LibraryCollectionsView: View {
    
    @StateObject private var collectionViewModel = LibraryCollectionViewModel()
    
    let columns = [GridItem(.adaptive(minimum: 120))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(collectionViewModel.storedMovies, id:\.id) { movie in
                    if let poster_path = movie.image_path {
                        if poster_path != "" {
                            NavigationLink(destination: MovieDetailsView(currentMovie: Int(movie.id))) {
                                KFImage(URL(string: poster_path)).resizable().frame(width: 120, height: 150).border(Color.gray)
                            }
                        } else {
                            
                            NavigationLink(destination: MovieDetailsView(currentMovie: Int(movie.id))) {
                                VStack {
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        Text(movie.title!).font(.caption2)
                                        Spacer()
                                    }
                                    Spacer()
                                }.frame(width: 120, height: 150).border(Color.gray)
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
        }.padding()
    }
}

struct LibraryCollectionsView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryCollectionsView()
    }
}