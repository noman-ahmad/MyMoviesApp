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
                    KFImage(URL(string: image_url)).resizable().frame(width:75, height: 125).background(Color.gray).border(Color.gray)
                } else {
                    Image("placeholder-poster").resizable().frame(width: 75, height: 125).background(Color.gray).border(Color.gray)
                }
            }
            
            VStack(alignment: .leading, spacing: 6) {
                
                if let title = movieEntity.title {
                    Text(title).fontWeight(.semibold).font(.subheadline)
                }
                HStack {
                    if let movieDirector = movieEntity.director {
                        if let movieYear = movieEntity.year_released {
                            Text("\(movieDirector) \u{2022} \(movieYear)").font(.caption).foregroundColor(.secondary)
                        }
                    }
                    
                }
                
                if let review = movieEntity.review {
                    Text(review).font(.caption2)
                }
                
                Spacer()
                
                
            }.frame(height: 125)
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
