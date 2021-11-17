//
//  MovieReccomendationsViewModel.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/16/21.
//

import Foundation

class MovieReccomendationsViewModel : ObservableObject {
    @Published private var movieResults : [IndividualMovieResponse]
    private var movieId : Int
    
    private var apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    private var currentPage = 1
    
    enum MovieReccomendationsViewModelError : Error {
        case invalidUrl
        case missingData
    }
    
    
    init(movie_id: Int? = nil) {
        if let id = movie_id {
            self.movieId = id
            movieResults = []
            Task {
                await getMovieReccomendationLoader()
            }
        } else {
            self.movieId = -1
            movieResults = []
        }
    }
    
    func update(movieId: Int) {
        self.movieId = movieId
        Task {
            await getMovieReccomendationLoader()
        }
    }
    
    func getMovieReccomendations() async throws  {
        //print("Successfully Entered Search Function")
        // query url
        let url = "https://api.themoviedb.org/3/movie/" + String(self.movieId) + "/recommendations?api_key=" + self.apiKey! + "&language=en-US&page=\(self.currentPage)"
       // print(url)
        guard let apiUrl = URL(string: url) else {
           print("Error with URL")
            throw MovieReccomendationsViewModelError.invalidUrl
        }
            // fetch data using URLSession
        let (data, _) = try await URLSession.shared.data(from: apiUrl)

            // parse returned api data
        let queryResult = try JSONDecoder().decode(MovieSearchResponse.self, from: data)
       //print(queryResult)
        DispatchQueue.main.async {
            if !self.movieResults.isEmpty {
                self.movieResults.append(contentsOf: queryResult.results)
            } else {
                self.movieResults = queryResult.results
            }
            self.currentPage = self.currentPage + 1
        }
    }

    func getMovieReccomendationLoader() async {
        do {
            try await getMovieReccomendations()
        } catch {
            //print("Error with Movie Results Searching")
            debugPrint(error)
        }
    }
    
    func getReccomendedMovies() -> [IndividualMovieResponse]{
        return movieResults
    }
    
}
