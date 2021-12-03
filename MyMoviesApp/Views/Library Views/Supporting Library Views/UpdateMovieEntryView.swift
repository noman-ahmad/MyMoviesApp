//
//  UpdateMovieEntryView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/16/21.
//

import SwiftUI

struct UpdateMovieEntryView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    @State var movieWatched : Bool
    @State var movieReview : String
    @State var movieRating : Float
    @State var movieCinemaRating : Float
    @State var movieStoryRating : Float
    @State var movieSoundRating : Float
    @State var movieActingRating : Float 
    
    var movieName : String
    var movieId : Int
    var movieDirector : String
    var movieYear : String
    
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Form {
                Section(header: Text("Watch Status")) {
                    
                    HStack {
                        Text("Movie Name")
                        Spacer()
                        Text(movieName).foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("Released")
                        Spacer()
                        Text(movieYear).foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("Director")
                        Spacer()
                        Text(movieDirector).foregroundColor(.secondary)
                    }
                    
                    Toggle(isOn: $movieWatched) {
                        Text("Watched")
                    }
                }
                
                if movieWatched {
                    Section(header: Text("Rate")) {
                        VStack {
                            Spacer()
                            Text("Overall")
                            Slider(value: $movieRating, in: 0...10, step: 0.5)
                            Text(String(format: "%.1f", movieRating))
                            Spacer()
                        }
                        
                        VStack {
                            Spacer()
                            Text("Story")
                            Slider(value: $movieStoryRating, in: 0...10, step: 0.5)
                            Text(String(format: "%.1f", movieStoryRating))
                            Spacer()
                        }
                        
                        VStack {
                            Spacer()
                            Text("Cinematography")
                            Slider(value: $movieCinemaRating, in: 0...10, step: 0.5)
                            Text(String(format: "%.1f", movieCinemaRating))
                            Spacer()
                        }
                        
                        VStack {
                            Spacer()
                            Text("Acting")
                            Slider(value: $movieActingRating, in: 0...10, step: 0.5)
                            Text(String(format: "%.1f", movieActingRating))
                            Spacer()
                        }
                        
                        VStack {
                            Spacer()
                            Text("Sound/Music")
                            Slider(value: $movieSoundRating, in: 0...10, step: 0.5)
                            Text(String(format: "%.1f", movieSoundRating))
                            Spacer()
                        }
                    }
                    Section(header : Text("Write a Review")) {
                        TextEditor(text: $movieReview).frame(height: 200).onTapGesture {
                            movieReview = ""
                        }.foregroundColor(.gray)
                    }
                    
                    Section {
                        Button {
                            CoreDataManager.shared.updateMovie(movieId: movieId, movieRating: movieRating, movieReview: movieReview, movieWatched: movieWatched, movieCinemaRating: movieCinemaRating, movieActingRating: movieActingRating, movieSoundRating: movieSoundRating, movieStoryRating: movieSoundRating)
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            HStack {
                                Spacer()
                                Text("Update")
                                Image(systemName: "square.and.pencil")
                                Spacer()
                            }.foregroundColor(Color.blue)
                        }
                    }
                }
                
                Section {
                    Button {
                        CoreDataManager.shared.deleteMovie(movieId: movieId)
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            Spacer()
                            Text("Delete")
                            Image(systemName: "trash.fill")
                            Spacer()
                        }.foregroundColor(Color.pink)
                    }
                }
                
            }
            Spacer()
        }    .navigationBarTitle("Edit Movie").navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    CoreDataManager.shared.updateMovie(movieId: movieId, movieRating: movieRating, movieReview: movieReview, movieWatched: movieWatched, movieCinemaRating: movieCinemaRating, movieActingRating: movieActingRating, movieSoundRating: movieSoundRating, movieStoryRating: movieStoryRating)
                    presentationMode.wrappedValue.dismiss()
                    
                } label : {
                    Text("Done")
            }
        }
    }
}


struct UpdateMovieEntryView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateMovieEntryView(movieWatched: false, movieReview: "", movieRating: 0, movieCinemaRating: 0, movieStoryRating: 0, movieSoundRating: 0, movieActingRating: 0, movieName: "", movieId: -1, movieDirector: "", movieYear: "" )
    }
}
