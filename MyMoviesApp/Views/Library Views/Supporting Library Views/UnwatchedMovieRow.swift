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
        
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
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
                }
                
                ToolbarItem(placement: .automatic) {
                    Menu {
                        Section(header: Text("Statistics")) {
                            
                            Button {
                                
                            } label: {
                                HStack {
                                    Text("Total Movies: \(unwatchedViewModel.storedMovies.count)")
                                    Image(systemName: "film.fill")
                                }
                            } .disabled(true)
                        }
                    } label : {
                        Image(systemName: "info.circle.fill").resizable().frame(width: 20, height: 20).foregroundColor(.primary)
                    }
                }
            }
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
