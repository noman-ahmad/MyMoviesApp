//
//  WatchedMoviesCollectionView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/17/21.
//

import SwiftUI

struct WatchedMoviesCollectionView: View {
    @StateObject private var watchedViewModel = WatchedMoviesViewModel()
    
    @AppStorage("SortingOptionWatched") private var sortingOptionWatched = 0
    
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    
    var body: some View {
            List {
                ForEach(watchedViewModel.storedMovies, id:\.id) {
                    movie in
                    NavigationLink(destination: MovieDetailsView(currentMovie: Int(movie.id))) {
                        LibraryWatchedRow(movieEntity: movie, movieId: Int(movie.id)).background(Color.clear)
                    }
                }
            }
            .listStyle(PlainListStyle())
        
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Menu {
                        Button {
                            watchedViewModel.sortDate()
                            sortingOptionWatched = 1
                        } label: {
                            HStack {
                                Text("Date Updated")
                                Image(systemName: "calendar.badge.clock")
                            }
                        }
                        
                        Button {
                            watchedViewModel.sortName()
                            sortingOptionWatched = 2
                        } label : {
                            HStack {
                                Text("Alphabetically")
                                Image(systemName: "textformat.abc")
                            }
                        }
                        
                        Button {
                            watchedViewModel.sortRating()
                            sortingOptionWatched = 0
                        } label : {
                            HStack {
                                Text("Overall Rating")
                                Image(systemName: "star.fill").foregroundColor(Color.blue)
                            }
                        }
                        
                        Button {
                            watchedViewModel.sortReleased()
                            sortingOptionWatched = 3
                        } label : {
                            HStack {
                                Text("Year Released")
                                Image(systemName: "calendar.circle.fill")
                            }
                        }
                        
                        Button {
                            watchedViewModel.sortDirector()
                            sortingOptionWatched = 4
                        } label : {
                            HStack {
                                Text("Director")
                                Image(systemName: "person.fill")
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
                                    Text("Total Movies: \(watchedViewModel.storedMovies.count)")
                                    Image(systemName: "film.fill")
                                }
                            } .disabled(true)
                            
                            Button {
                                
                            } label: {
                                HStack {
                                    Text(String(format: "Average Rating: %.1f", watchedViewModel.getAverage()))
                                    Image(systemName: "star.fill")
                                }
                            } .disabled(true)
                        }
                    } label : {
                        Image(systemName: "info.circle.fill").resizable().frame(width: 20, height: 20).foregroundColor(.primary)
                    }
                }
                
            }
              .onAppear() {
                  //UITableView.appearance().contentInset.top = -35
                  
                  if sortingOptionWatched == 0 {
                      watchedViewModel.sortRating()
                  }
                  else if sortingOptionWatched == 1 {
                      watchedViewModel.sortDate()
                  }
                  else if sortingOptionWatched == 2 {
                      watchedViewModel.sortName()
                  }
                  else if sortingOptionWatched == 3 {
                      watchedViewModel.sortReleased()
                  }
                  else if sortingOptionWatched == 4 {
                      watchedViewModel.sortDirector()
                  }
              }
    }
}



struct WatchedMoviesCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        WatchedMoviesCollectionView()
    }
}
