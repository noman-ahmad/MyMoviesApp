//
//  MovieDetailsView.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/3/21.
//

import SwiftUI
import CachedAsyncImage

struct MovieDetailsView: View {
    
    
    var movieId : Int
    
    @State private var movieDetails = IndividualMovieDetailResponse()
    @State private var movieReccomendations = [IndividualMovieResponse()]
    @State private var credits = CastCrewResponse()
    
    
    var body: some View {

            List {
                MovieImageDescriptionView(movieDetails: movieDetails)
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                Section("Description") {
                    MovieDetailsDescriptionView(movieDetails: movieDetails)
                }
                Section("Details"){
                    if let original_title = movieDetails.original_title {
                        HStack {
                            Text("Orginal Title").font(.subheadline)
                            Spacer()
                            Text(original_title).font(.subheadline)
                        }
                    }
                    if let runtime = movieDetails.runtime {
                        HStack {
                            Text("Runtime").font(.subheadline)
                            Spacer()
                            Text(hourConvert(forMins: runtime)).font(.subheadline)
                        }
                    }
                    if let release_year = movieDetails.release_date {
                        HStack {
                            Text("Released").font(.subheadline)
                            Spacer()
                            Text(release_year.prefix(4)).font(.subheadline)
                        }
                    }
                    if let genres = movieDetails.genres {
                        HStack {
                            Text("Genre").font(.subheadline)
                            Spacer()
                            Text(genreConvert(forGenres: genres)).font(.subheadline)
                        }
                    }
//                    if let country = movieDetails.production_countries {
//                        HStack {
//                            Text("Country").font(.subheadline)
//                            Spacer()
//                            Text(countryConvert(forCountry: country)).font(.subheadline)
//                        }
//                    }
                }
                
                Section("Recommended") {
                    MovieReccomendationsView(recommended: movieReccomendations)
                }
//
                Section("Crew") {
                    if getCrew(forJob: "Director") != "Unknown"{
                        HStack {
                            Text("Director").font(.subheadline)
                            Spacer()
                            Text(getCrew(forJob: "Director")).font(.subheadline)
                        }
                    }
                    if getCrew(forJob: "Executive Producer") != "Unknown"{
                        HStack {
                            Text("Executive Producer").font(.subheadline)
                            Spacer()
                            Text(getCrew(forJob: "Executive Producer")).font(.subheadline)
                        }
                    }
                    if getCrew(forJob: "Original Music Composer") != "Unknown"{
                        HStack {
                            Text("Original Music").font(.subheadline)
                            Spacer()
                            Text(getCrew(forJob: "Original Music Composer")).font(.subheadline)
                        }
                    }



                }
                Section("Cast") {
                    if let cast = getActors() {
                        ForEach(cast, id: \.order) {
                            cast in
                            HStack {
                                Text(cast.name).font(.subheadline)
                                Spacer()
                                Text(cast.character).font(.subheadline)
                            }
                        }
                    }
                }

            }.id(UUID()).listStyle(GroupedListStyle())
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle(movieDetails.title)
        .toolbar {
            Button(action: {
                print("clicked")
            }) {
                Image(systemName: "plus.circle.fill")
            }
        }
        
            .onAppear() {
                Task {
                    print("Detail Here")
                    movieDetails = await requestManager.getMovieDetailLoader(movieId: movieId)
//                    print(movieDetails)
                }
                
                Task {
                    print("Cast/Crew Here")
                    credits = await requestManager.getCreditsDetailLoader(movieId: movieId)
//                    print(credits)
                }
                
                Task {
                    print("Reccomendations Here")
                    movieReccomendations = await requestManager.getMovieReccomendationLoader(movieId: movieId)
                }
            }
    }
    
    private func getActors() -> [CastResponse] {
        if credits.cast.count <= 10 {
            return credits.cast
        } else {
            return Array(credits.cast.prefix(10))
        }
    }
    
    private func countryConvert(forCountry: [ProductionCountryResponse]) -> String {
        if forCountry.isEmpty {
            return "Unknown"
        } else {
            return "\(forCountry[0].name)"
        }
    }
    
    
    private func genreConvert(forGenres: [GenreResponse]) -> String {
        if forGenres.isEmpty {
            return "Unknown"
        } else {
            return "\(forGenres[0].name)"
        }
    }
    
    private func hourConvert(forMins: Int) -> String {
        let hours = forMins / 60
        let mins = forMins % 60
        
        if (hours == 0) && (mins == 0) {
            return "Unknown"
        } else if (hours == 0) {
            return "\(mins) min"
        } else if (mins == 0) {
            return "\(hours) hr"
        } else {
            return "\(hours) hr \(mins) min"
        }
    }
    
    private func getCrew(forJob: String) -> String {
        var results : [CrewResponse] = []
        for crew in credits.crew {
            if crew.job == forJob {
                results.append(crew)
            }
        }
        if results.isEmpty {
            return "Unknown"
        } else if results.count == 1 {
            return "\(results[0].original_name)"
        } else {
            return "\(results[0].original_name), \(results[1].original_name)"
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movieId: -1)
    }
}
