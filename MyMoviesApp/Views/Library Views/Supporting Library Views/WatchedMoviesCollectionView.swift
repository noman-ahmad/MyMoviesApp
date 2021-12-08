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
            HStack {
                
                
                Menu {
                    
                    Text("Diamond: 10.0")
                    
                    Text("Ruby: 9.0 - 9.5")
                    
                    Text("Gold: 8.0 - 8.5")
                    
                    Text("Silver: 6.0 - 7.5")
                    
                    Text("Bronze: 4.0 - 5.5")
                    
                    Text("Rotten: 0.0 - 3.5")
                    
                } label : {
                    Image(systemName: "star.fill").resizable().frame(width: 20, height: 20).foregroundColor(.primary)
                }.padding(.leading)
                
                Spacer()
                
                Text("\(watchedViewModel.storedMovies.count) Movies Watched").font(.headline)
                
                Spacer()
                
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
            List {
                ForEach(watchedViewModel.storedMovies, id:\.id) {
                    movie in
                    NavigationLink(destination: MovieDetailsView(currentMovie: Int(movie.id))) {
                        LibraryWatchedRow(movieEntity: movie, movieId: Int(movie.id)).background(Color.clear)
                    }
                }
            } .refreshable {
                //watchedViewModel.getAllMoviesWatched()
            } .listStyle(PlainListStyle())
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
