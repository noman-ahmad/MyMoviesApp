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
    
    @AppStorage("SortingOptionCollection") private var sortingOptionCollection = 0
    
    var body: some View {
        
        ZStack {
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
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Menu {
                    Button {
                        collectionViewModel.getAllMoviesDate()
                        sortingOptionCollection = 0
                    } label: {
                        HStack {
                            Text("Date Updated")
                            Image(systemName: "calendar.badge.clock")
                        }
                    }

                    Button {
                        collectionViewModel.getAllMoviesTitle()
                        sortingOptionCollection = 1
                    } label : {
                        HStack {
                            Text("Alphabetically")
                            Image(systemName: "textformat.abc")
                        }
                    }


                    Button {
                        collectionViewModel.getAllMoviesReleased()
                        sortingOptionCollection = 2
                    } label : {
                        HStack {
                            Text("Year Released")
                            Image(systemName: "calendar.circle.fill")
                        }
                    }

                    Button {
                        collectionViewModel.getAllMoviesDirector()
                        sortingOptionCollection = 3
                    } label : {
                        HStack {
                            Text("Director")
                            Image(systemName: "person.fill")
                        }
                    }

                    Button {
                        collectionViewModel.getAllMoviesUnwatched()
                        sortingOptionCollection = 4
                    } label : {
                        HStack {
                            Text("Unwatched")
                            Image(systemName: "tv")
                        }
                    }

                    Button {
                        collectionViewModel.getAllMoviesWatched()
                        sortingOptionCollection = 5
                    } label : {
                        HStack {
                            Text("Watched")
                            Image(systemName: "tv.fill")
                        }
                    }

                } label: {
                    Image(systemName: "arrow.up.arrow.down.circle.fill").resizable().frame(width: 20, height: 20).foregroundColor(.primary)
                }.padding(.trailing)
                
                
            }
            
            ToolbarItem(placement: .automatic) {
                Menu {
                    Section(header: Text("Statistics")) {
                        
                        Button {
                            
                        } label: {
                            HStack {
                                Text("Total Movies: \(collectionViewModel.storedMovies.count)")
                                Image(systemName: "film.fill")
                            }
                        } .disabled(true)
                    }
                } label : {
                    Image(systemName: "info.circle.fill").resizable().frame(width: 20, height: 20).foregroundColor(.primary)
                }
            }
        }
            .padding(.leading)
            .padding(.trailing)
            .onAppear() {
                
                
                if sortingOptionCollection == 0 {
                    collectionViewModel.getAllMoviesDate()
                }
                else if sortingOptionCollection == 1 {
                    collectionViewModel.getAllMoviesTitle()
                }
                else if sortingOptionCollection == 2 {
                    collectionViewModel.getAllMoviesReleased()
                }
                else if sortingOptionCollection == 3 {
                    collectionViewModel.getAllMoviesDirector()
                }
                else if sortingOptionCollection == 4 {
                    collectionViewModel.getAllMoviesUnwatched()
                }
                else if sortingOptionCollection == 5 {
                    collectionViewModel.getAllMoviesWatched()
                }
        }
    }
        
}

struct LibraryCollectionsView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryCollectionsView()
    }
}
