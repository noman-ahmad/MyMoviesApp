//
//  UnwatchedMovieRow.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/13/21.
//

import SwiftUI
import Kingfisher

struct UnwatchedMovieRow: View {
    @StateObject private var unwatchedViewModel = UnwatchedMoviesViewModel()
    //@StateObject private var coreData = CoreDataManager.shared
    @AppStorage("SortingOptionUnwatched") private var sortingOptionUnwatched = 0
    
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
            
            Text("\(unwatchedViewModel.storedMovies.count) Movies Planned").font(.headline)
            
            Spacer()
            
            Menu {
                Button {
                    unwatchedViewModel.getAllMoviesUnwatchedDate()
                    sortingOptionUnwatched = 0
                } label: {
                    HStack {
                        Text("Date Updated")
                        Image(systemName: "calendar.badge.clock")
                    }
                }
                
                Button {
                    unwatchedViewModel.getAllMoviesUnwatchedName()
                    sortingOptionUnwatched = 1
                } label : {
                    HStack {
                        Text("Alphabetically")
                        Image(systemName: "textformat.abc")
                    }
                }
                
                
                Button {
                    unwatchedViewModel.getAllMoviesUnwatchedReleased()
                    sortingOptionUnwatched = 2
                } label : {
                    HStack {
                        Text("Year Released")
                        Image(systemName: "calendar.circle.fill")
                    }
                }
                
                Button {
                    unwatchedViewModel.getAllMoviesUnwatchedDirector()
                    sortingOptionUnwatched = 3
                } label : {
                    HStack {
                        Text("Director")
                        Image(systemName: "person.fill")
                    }
                }
                
            } label: {
                Image(systemName: "arrow.up.arrow.down.circle.fill").resizable().frame(width: 20, height: 20).foregroundColor(.primary)
            }.padding(.trailing)
        }.frame(alignment: .leading)
        
        List {
            ForEach(unwatchedViewModel.storedMovies, id:\.id) {
                movie in
                NavigationLink(destination: MovieDetailsView(currentMovie: Int(movie.id))) {
                    LibraryUnwatchedRow(movieEntity: movie, movieId: Int(movie.id))
                }
            }
        } .refreshable {
//            unwatchedViewModel.getAllMoviesUnwatched()
        } .listStyle(PlainListStyle())
        .onAppear(){
            if sortingOptionUnwatched == 0 {
                unwatchedViewModel.getAllMoviesUnwatchedDate()
            }
            else if sortingOptionUnwatched == 1 {
                unwatchedViewModel.getAllMoviesUnwatchedName()
            }
            else if sortingOptionUnwatched == 2 {
                unwatchedViewModel.getAllMoviesUnwatchedReleased()
            }
            else if sortingOptionUnwatched == 3 {
                unwatchedViewModel.getAllMoviesUnwatchedDirector()
            }
        }

    }
}

struct UnwatchedMovieRow_Previews: PreviewProvider {
    static var previews: some View {
        UnwatchedMovieRow()
    }
}
