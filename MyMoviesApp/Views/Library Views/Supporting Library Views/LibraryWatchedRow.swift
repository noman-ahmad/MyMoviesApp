//
//  LibraryWatchedRow.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/18/21.
//

import SwiftUI
import Kingfisher

struct LibraryWatchedRow: View {
    
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
                
                HStack(spacing:3) {
                    Image(systemName: "star.fill").resizable().frame(width: 10, height: 10)
                    Text(String(movieEntity.rating)).fontWeight(.semibold).font(.caption)
                }
                Spacer()
                
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
                            UpdateMovieEntryView(movieWatched: movieEntity.watch_status, movieReview: movieEntity.review!, movieRating: movieEntity.rating, movieCinemaRating: movieEntity.cinema_rating, movieStoryRating: movieEntity.story_rating, movieSoundRating: movieEntity.sound_rating, movieActingRating: movieEntity.acting_rating, movieName: title, movieId: Int(movieEntity.id), movieDirector: movieEntity.director!, movieYear: movieEntity.year_released!)
                        }
                    }
            }
        }.ignoresSafeArea().frame(alignment: .leading)
        
    }
}

struct LibraryWatchedRow_Previews: PreviewProvider {
    static var previews: some View {
        LibraryWatchedRow(movieEntity: StoredMovie(), movieId: -1)
    }
}
