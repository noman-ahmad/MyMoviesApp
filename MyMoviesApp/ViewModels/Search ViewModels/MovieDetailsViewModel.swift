//
//  MovieDetailsViewModel.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/11/21.
//

import Foundation
import CoreData
import SwiftUI



class MovieDetailsViewModel : ObservableObject {
    
    // binded to view, so view changes if updated
    @Published private var currentMovie : IndividualMovieDetailResponse
    @Published private var currentMovieCast : [CastResponse]
    @Published private var currentMovieCrew : [CrewResponse]
    @Published private var movieReccomendations : [IndividualMovieResponse]
    @Published private var movieReviews : [ReviewResults]
    @Published private var movieVideos : [VideoResult]
    
    @Environment(\.managedObjectContext) private var moc
    
    
    
    
    enum MovieDetailsViewModelError : Error {
        case invalidURL
        case missingData
    }
    
    private var apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    init() {
        self.currentMovie = IndividualMovieDetailResponse()
        self.currentMovieCast = []
        self.currentMovieCrew = []
        self.movieReccomendations = []
        self.movieReviews = []
        self.movieVideos = []
    }
    
    
    func getMovieName() -> String {
        return currentMovie.title
    }
    
    func getMoviePosterPath() -> String {
        if let poster_path = self.currentMovie.poster_path {
            return "https://image.tmdb.org/t/p/w500/\(poster_path)"
        } else {
            return "" 
        }
    }
    
    
    func getMovieRuntime() -> String {
        if let runtime = self.currentMovie.runtime {
            if runtime == 0 {
                return ""
            }
            let hours = runtime / 60
            let minutes = runtime % 60
            if (hours == 0 && minutes == 0) {
                return ""
            } else if hours == 0 {
                return "\(minutes)min"
            } else if (minutes == 0) {
                return "\(hours)h"
            } else {
                return "\(hours)h \(minutes)min"
            }
        } else {
            return ""
        }
    }
    
    func getMovieGenres() -> String {
        let genres = self.currentMovie.genres
            if genres.count == 0 {
                return ""
            } else if genres.count == 1 {
                return genres[0].name
            } else {
                return "\(genres[0].name), \(genres[1].name)"
            }
    }
    
    func getMovieRating() -> String {
        let rating = self.currentMovie.vote_average
        if (rating < 1.0) {
            return "ZeroRating"
        } else if (rating < 2.0) {
            return "ZeroFiveRating"
        } else if (rating < 3.0) {
            return "OneRating"
        } else if (rating < 4.0) {
            return "OneFiveRating"
        } else if (rating < 5.0) {
            return "TwoRating"
        } else if (rating < 6.0) {
            return "TwoFiveRating"
        } else if (rating < 7.0) {
            return "ThreeRating"
        } else if (rating < 8.0) {
            return "ThreeFiveRating"
        } else if (rating < 8.5) {
            return "FourRating"
        } else if (rating < 9.0) {
            return "FourFiveRating"
        } else {
            return "FiveRating"
        }
    }
    
    func getMovieCast() -> [CastResponse] {
        return self.currentMovieCast
    }
    
        func getCreditsDetail(movieId: Int) async throws  {
            //print("Successfully Entered Search Function")
            // query url
            let url = "https://api.themoviedb.org/3/movie/" + String(movieId) + "/credits?api_key=" + self.apiKey! + "&language=en-US"
           // print(url)
            guard let apiUrl = URL(string: url) else {
                //print("Error with URL")
                throw MovieDetailsViewModelError.invalidURL
            }
                // fetch data using URLSession
            let (data, _) = try await URLSession.shared.data(from: apiUrl)
    
                // parse returned api data
            let queryResult = try JSONDecoder().decode(CastCrewResponse.self, from: data)
           // print(queryResult)
            DispatchQueue.main.async {
                self.currentMovieCast = queryResult.cast
                self.currentMovieCrew = queryResult.crew
            }
        }
    //
        func getCreditsDetailLoader(movieId: Int) async{
            do {
                try await getCreditsDetail(movieId: movieId)
            } catch {
               // print("Error with Movie Results Searching")
                debugPrint(error)
            }
        }
    
    
        func getMovieDetail(movieId: Int) async throws  {
            //print("Successfully Entered Search Function")
            // query url
            let url = "https://api.themoviedb.org/3/movie/" + String(movieId) + "?api_key=" + self.apiKey! + "&language=en-US"
            //print(url)
            guard let apiUrl = URL(string: url) else {
               // print("Error with URL")
                throw MovieDetailsViewModelError.invalidURL
            }
                // fetch data using URLSession
            let (data, _) = try await URLSession.shared.data(from: apiUrl)
    
                // parse returned api data
            let queryResult = try JSONDecoder().decode(IndividualMovieDetailResponse.self, from: data)
            //print(queryResult)
            DispatchQueue.main.async {
                self.currentMovie = queryResult
            }
    
        }
    
        func getMovieDetailLoader(movieId: Int) async {
            do {
                try await getMovieDetail(movieId: movieId)
            } catch {
                //print("Error with Movie Results Searching")
                debugPrint(error)
            }
        }
    
    
    func getMovieBackdropPath() -> String {
        if let backdrop_path = self.currentMovie.backdrop_path {
            //print(backdrop_path)
            return "https://image.tmdb.org/t/p/original/\(backdrop_path)"
        } else {
            return ""
        }
    }
    
    func getMovieYear() -> String {
        let release_date = self.currentMovie.release_date
        if release_date.count > 4 {
            return String(release_date.prefix(4))
        } else {
            return ""
        }
    }
    
    func getMovieDescription() -> String {
        if let description = self.currentMovie.overview {
            return description
        } else {
            return "" 
        }
    }
    
    
        func getMovieReccomendations(movieId: Int) async throws  {
            //print("Successfully Entered Search Function")
            // query url
            let url = "https://api.themoviedb.org/3/movie/" + String(movieId) + "/recommendations?api_key=" + self.apiKey! + "&language=en-US&page=1"
           // print(url)
            guard let apiUrl = URL(string: url) else {
               // print("Error with URL")
                throw MovieDetailsViewModelError.invalidURL
            }
                // fetch data using URLSession
            let (data, _) = try await URLSession.shared.data(from: apiUrl)
    
                // parse returned api data
            let queryResult = try JSONDecoder().decode(MovieSearchResponse.self, from: data)
           // print(queryResult)
            DispatchQueue.main.async {
                self.movieReccomendations = queryResult.results
            }
    
        }
    
        func getMovieReccomendationLoader(movieId: Int) async {
            do {
                try await getMovieReccomendations(movieId: movieId)
            } catch {
                //print("Error with Movie Results Searching")
                debugPrint(error)
            }
        }
    
    
    func getMovieReviews(movieId: Int) async throws  {
        //print("Successfully Entered Search Function")
        // query url
        let url = "https://api.themoviedb.org/3/movie/" + String(movieId) + "/reviews?api_key=" + self.apiKey! + "&language=en-US&page=1"
       // print(url)
        guard let apiUrl = URL(string: url) else {
           // print("Error with URL")
            throw MovieDetailsViewModelError.invalidURL
        }
            // fetch data using URLSession
        let (data, _) = try await URLSession.shared.data(from: apiUrl)

            // parse returned api data
        let queryResult = try JSONDecoder().decode(MovieReviewResponse.self, from: data)
       // print(queryResult)
        DispatchQueue.main.async {
            self.movieReviews = queryResult.results
        }

    }

    func getMovieReviewsLoader(movieId: Int) async {
        do {
            try await getMovieReviews(movieId: movieId)
        } catch {
            //print("Error with Movie Results Searching")
            debugPrint(error)
        }
    }
    
    func getMovieVideos(movieId: Int) async throws  {
        //print("Successfully Entered Search Function")
        // query url
        let url = "https://api.themoviedb.org/3/movie/" + String(movieId) + "/videos?api_key=" + self.apiKey! + "&language=en-US"
        //print(url)
        guard let apiUrl = URL(string: url) else {
           // print("Error with URL")
            throw MovieDetailsViewModelError.invalidURL
        }
            // fetch data using URLSession
        let (data, _) = try await URLSession.shared.data(from: apiUrl)

            // parse returned api data
        let queryResult = try JSONDecoder().decode(MovieVideoResponse.self, from: data)
        //print(queryResult)
        DispatchQueue.main.async {
            self.movieVideos = queryResult.results
        }

    }

    func getMovieVideosLoader(movieId: Int) async {
        do {
            try await getMovieVideos(movieId: movieId)
        } catch {
            //print("Error with Movie Results Searching")
            debugPrint(error)
        }
    }
    
    func getMovieReccomendations() -> [IndividualMovieResponse] {
        return movieReccomendations
    }
    
    func getMovieReviews() -> [ReviewResults] {
        return movieReviews
    }
    
    func getMovieVideos() -> [VideoResult] {
        return movieVideos
    }
    
    func getMovieId() -> Int{
        return currentMovie.id
    }
    
//    func addMovieToPersistence() {
//        let newMovie = StoredMovie(context: self.moc)
//        newMovie.id = Int64(currentMovie.id)
//        newMovie.title = currentMovie.title
//        newMovie.watch_status = false
//        newMovie.rating = 0
//        
//        do {
//            try self.moc.save()
//        }catch {
//            print("Didnt Work")
//        }
//    }
    
    func getMovieDirectors() -> String {
        var directors : [String] = []
        for crew in currentMovieCrew {
            if (crew.job == "Director") {
                directors.append(crew.name)
            }
        }
        if directors.isEmpty {
            return ""
        } else if directors.count == 1 {
            return "A Film By \(directors[0])"
        } else if directors.count == 2 {
            return "A Film By \(directors[0]) & \(directors[1])"
        } else {
            var to_return = "A Film By \(directors[0]), "
            for i in 1...(directors.count-2) {
                to_return = to_return + "\(directors[i]), "
            }
            to_return = to_return + "\(directors[directors.count-1])"
            return to_return
        }
    }
    
    
    func saveToPersistance() {
        let movie = StoredMovie(context: CoreDataManager.shared.viewContext)
        movie.id = Int64(getMovieId())
        movie.title = getMovieName()
        movie.watch_status = false
        movie.rating = 0
        movie.review = ""
        movie.image_path = getMoviePosterPath()
        
        CoreDataManager.shared.save()
    }
}
