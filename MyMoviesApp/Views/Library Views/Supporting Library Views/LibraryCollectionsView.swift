//
//  LibraryCollectionsView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/13/21.
//

import SwiftUI
import Kingfisher

struct LibraryCollectionsView: View {
    
    @FetchRequest(entity: StoredMovie.entity(), sortDescriptors: []) var movies : FetchedResults<StoredMovie>
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(movies, id:\.id) { movie in
                    if let poster_path = movie.image_path {
                        if poster_path != "" {
                            NavigationLink(destination: MovieDetailsView(currentMovie: Int(movie.id))) {
                                KFImage(URL(string: poster_path)).resizable().frame(width: 80, height: 120).cornerRadius(5).overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
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
                                }.frame(width: 80, height: 120).cornerRadius(5).overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1)).scaledToFit()
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
