//
//  UpdateMovieEntryView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/16/21.
//

import SwiftUI

struct UpdateMovieEntryView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    @State var movieWatched : Bool = false
    @State var movieReview : String = ""
    @State var movieRating : String = "5"
    var movieName : String
    var movieId : Int
    var watched_initial : Bool
    
    var ratings = ["0", "0.5", "1.0", "1.5", "2", "2.0", "2.5", "3", "3.5", "4", "4.5", "5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10"]
    
    
    
    var body: some View {
        Form {
            Section(header: Text("Watch Status")) {
                
                HStack {
                    Text("Movie Name")
                    Spacer()
                    Text(movieName).foregroundColor(.secondary)
                }
                
                Toggle(isOn: $movieWatched) {
                    Text("Watched")
                }
            }
            
            if movieWatched {
                Section(header: Text("Rate")) {
                    HStack {
                        Spacer()
                        Picker("Rate Movie", selection: $movieRating) {
                            ForEach(ratings, id: \.self) {
                                Text($0).tag($0)
                            }
                        }.pickerStyle(.wheel).frame(width: 100, height: 100)
                        Spacer()
                    }
                }
                Section(header : Text("Write a Review")) {
                    TextEditor(text: $movieReview).frame(height: 200).onTapGesture {
                        movieReview = ""
                    }.foregroundColor(.gray)
                }
            }
            
        }.navigationBarTitle("Edit Movie").navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    CoreDataManager.shared.updateMovie(movieId: movieId, movieRating: Float(movieRating)!, movieReview: movieReview, movieWatched: movieWatched)
                    presentationMode.wrappedValue.dismiss()
                    
                } label : {
                    Text("Done")
            }
            .onAppear {
                if (watched_initial == true) {
                    movieWatched = true
                }
            }
        }
    }
}

struct UpdateMovieEntryView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateMovieEntryView(movieName: "", movieId: -1, watched_initial: false)
    }
}
