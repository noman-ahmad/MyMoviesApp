//
//  WatchedMoviesCollectionView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/17/21.
//

import SwiftUI

struct WatchedMoviesCollectionView: View {
    @StateObject private var watchedViewModel = WatchedMoviesViewModel()
    
    @State private var sortingOption = 0
    
    
    
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
            
            Text("\(watchedViewModel.storedMovies.count) Movies").font(.headline)
            
            Spacer()
            
            Menu {
                Button {
                    watchedViewModel.sortDate()
                } label: {
                    HStack {
                        Text("Date Updated")
                        Image(systemName: "calendar.badge.clock")
                    }
                }
                
                Button {
                    watchedViewModel.sortName()
                } label : {
                    HStack {
                        Text("Alphabetically")
                        Image(systemName: "textformat.abc")
                    }
                }
                
                Button {
                    watchedViewModel.sortRating()
                } label : {
                    HStack {
                        Text("Overall Rating")
                        Image(systemName: "star.fill").foregroundColor(Color.blue)
                    }
                }
                
                Button {
                    watchedViewModel.sortReleased()
                } label : {
                    HStack {
                        Text("Year Released")
                        Image(systemName: "calendar.circle.fill") 
                    }
                }
                
                Button {
                    watchedViewModel.sortDirector()
                } label : {
                    HStack {
                        Text("Director")
                        Image(systemName: "person.fill")
                    }
                }
                
            } label: {
                Image(systemName: "arrow.up.arrow.down.circle.fill").resizable().frame(width: 20, height: 20).foregroundColor(.primary)
            }.padding(.trailing)
        }.padding(.leading).padding(.trailing).ignoresSafeArea().frame(alignment: .leading)
        
        List {
            ForEach(watchedViewModel.storedMovies, id:\.id) {
                movie in
                NavigationLink(destination: MovieDetailsView(currentMovie: Int(movie.id))) {
                    LibraryWatchedRow(movieEntity: movie, movieId: Int(movie.id))
                }
            }
        } .refreshable {
            watchedViewModel.getAllMoviesWatched()
        } .listStyle(InsetListStyle())
          .onAppear() {
            watchedViewModel.getAllMoviesWatched()
          }
    }
}



struct WatchedMoviesCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        WatchedMoviesCollectionView()
    }
}
