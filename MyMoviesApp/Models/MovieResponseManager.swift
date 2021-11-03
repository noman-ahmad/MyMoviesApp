//
//  MovieResponseManager.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/2/21.
//

import Foundation

class MovieResponseManager {
    // enum to handle errors from api manager
    enum MovieResponseManagerError : Error {
        case invalidURL
        case missingData
    }
    // api key
    private var apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    //default constructor
    init() {
        print("Successfully Created API Manager")
    }
    
    func getMovieSearch(queryString: String) async throws -> MovieSearchResponse {
        print("Successfully Entered Search Function")
        // query url
        let url = "https://api.themoviedb.org/3/search/movie?api_key=" + self.apiKey! + "&language=en-US&query=" + queryString + "&page=1&include_adult=false"
        print(url)
        guard let apiUrl = URL(string: url) else {
            print("Error with URL")
            throw MovieResponseManagerError.invalidURL
        }
            // fetch data using URLSession
        let (data, _) = try await URLSession.shared.data(from: apiUrl)
            
            // parse returned api data
        let queryResult = try JSONDecoder().decode(MovieSearchResponse.self, from: data)
        print(queryResult)
        return queryResult
        
    }
    
    func getMovieSearchLoader(queryString: String) async -> [IndividualMovieResponse] {
        do {
            let movieReponse = try await getMovieSearch(queryString: queryString)
            let movieResults = movieReponse.results
            return movieResults
        } catch {
            print("Error with Movie Results Searching")
            return []
        }
    }
    
    
    func getMovieDetail(movieId: Int) async throws -> IndividualMovieDetailResponse {
        print("Successfully Entered Search Function")
        // query url
        let url = "https://api.themoviedb.org/3/movie/" + String(movieId) + "?api_key=" + self.apiKey! + "&language=en-US"
        print(url)
        guard let apiUrl = URL(string: url) else {
            print("Error with URL")
            throw MovieResponseManagerError.invalidURL
        }
            // fetch data using URLSession
        let (data, _) = try await URLSession.shared.data(from: apiUrl)
            
            // parse returned api data
        let queryResult = try JSONDecoder().decode(IndividualMovieDetailResponse.self, from: data)
        print(queryResult)
        return queryResult
        
    }
    
    func getMovieDetailLoader(movieId: Int) async -> IndividualMovieDetailResponse{
        do {
            let movieResponse = try await getMovieDetail(movieId: movieId)
            let movieResult = movieResponse
            return movieResult
        } catch {
            print("Error with Movie Results Searching")
            return IndividualMovieDetailResponse(adult: false, backdrop_path: nil, budget: -1, genres: [], homepage: nil, id: -1, imdb_id: -1, original_language: "", original_title: "", overview: nil, popularity: -1, poster_path: nil, production_companies: [], production_countries: [], release_date: "", revenue: -1, runtime: nil, spoken_languages: [], status: "", tagline: nil, title: "", video: false, vote_average: -1, vote_count: -1)
        }
    }
    
}


