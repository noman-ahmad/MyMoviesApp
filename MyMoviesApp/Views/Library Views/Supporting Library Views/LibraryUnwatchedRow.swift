//
//  LibraryUnwatchedRow.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 12/1/21.
//

import SwiftUI
import Kingfisher

struct LibraryUnwatchedRow: View {
    
    @State var movieEntity : StoredMovie
    var movieId : Int
    
    @State private var showingSheet = false
    
    var body: some View {
        HStack {
            VStack {
                if let image_url = movieEntity.image_path {
                    KFImage(URL(string: image_url)).resizable().aspectRatio(contentMode: .fill).ignoresSafeArea().frame(width:75, height: 100).background(Color.gray)
                } else {
                    Image("placeholder-poster").resizable().aspectRatio(contentMode: .fill).frame(width: 75, height: 100).background(Color.gray)
                }
            }
            
            VStack(alignment: .leading, spacing: 6) {
                
                if let title = movieEntity.title {
                    Text(title).font(.caption)
                }
                if let movieYear = movieEntity.year_released {
                    Text(movieYear).font(.caption2)
                }
                Spacer()
                
            }.frame(height: 100)
            Spacer()
            VStack {
                Button {
                    print("Here")
                    showingSheet.toggle()
                } label: {
                    HStack {
                        Image(systemName: "square.and.pencil").resizable().frame(width: 20, height: 20)
                    }
                } .buttonStyle(PlainButtonStyle())
                    .sheet(isPresented: $showingSheet) {
                        if let title = movieEntity.title {
                            UpdateMovieEntryView(movieWatched: false, movieReview: "", movieRating: 5, movieCinemaRating: 5, movieStoryRating: 5, movieSoundRating: 5, movieActingRating: 5, movieName: title, movieId: Int(movieEntity.id), movieDirector: movieEntity.director!, movieYear: movieEntity.year_released!)
                        }
                    }
            }
        }.ignoresSafeArea().frame(alignment: .leading)
        
    }
}

struct LibraryUnwatchedRow_Previews: PreviewProvider {
    static var previews: some View {
        LibraryUnwatchedRow(movieEntity: StoredMovie(), movieId: -1)
    }
}
