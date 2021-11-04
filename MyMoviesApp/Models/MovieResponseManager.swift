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
        //print("Successfully Created API Manager")
    }
    
    func getMovieSearch(queryString: String) async throws -> MovieSearchResponse {
        //print("Successfully Entered Search Function")
        // query url
        let url = "https://api.themoviedb.org/3/search/movie?api_key=" + self.apiKey! + "&language=en-US&query=" + queryString + "&page=1&include_adult=false"
        //print(url)
        guard let apiUrl = URL(string: url) else {
            //print("Error with URL")
            throw MovieResponseManagerError.invalidURL
        }
            // fetch data using URLSession
        let (data, _) = try await URLSession.shared.data(from: apiUrl)
            
            // parse returned api data
        let queryResult = try JSONDecoder().decode(MovieSearchResponse.self, from: data)
      //  print(queryResult)
        return queryResult
        
    }
    
    func getMovieSearchLoader(queryString: String) async -> [IndividualMovieResponse] {
        do {
            let movieReponse = try await getMovieSearch(queryString: queryString)
            let movieResults = movieReponse.results
            return movieResults
        } catch {
           // print("Error with Movie Results Searching")
            debugPrint(error)
            return []
        }
    }
    
    
    func getMovieDetail(movieId: Int) async throws -> IndividualMovieDetailResponse {
        //print("Successfully Entered Search Function")
        // query url
        let url = "https://api.themoviedb.org/3/movie/" + String(movieId) + "?api_key=" + self.apiKey! + "&language=en-US"
        //print(url)
        guard let apiUrl = URL(string: url) else {
           // print("Error with URL")
            throw MovieResponseManagerError.invalidURL
        }
            // fetch data using URLSession
        let (data, _) = try await URLSession.shared.data(from: apiUrl)
            
            // parse returned api data
        let queryResult = try JSONDecoder().decode(IndividualMovieDetailResponse.self, from: data)
        //print(queryResult)
        return queryResult
        
    }
    
    func getMovieDetailLoader(movieId: Int) async -> IndividualMovieDetailResponse{
        do {
            let movieResponse = try await getMovieDetail(movieId: movieId)
            let movieResult = movieResponse
            return movieResult
        } catch {
            //print("Error with Movie Results Searching")
            debugPrint(error)
            return IndividualMovieDetailResponse()
        }
    }
    
    func getCreditsDetail(movieId: Int) async throws -> CastCrewResponse {
        //print("Successfully Entered Search Function")
        // query url
        let url = "https://api.themoviedb.org/3/movie/" + String(movieId) + "/credits?api_key=" + self.apiKey! + "&language=en-US"
       // print(url)
        guard let apiUrl = URL(string: url) else {
            //print("Error with URL")
            throw MovieResponseManagerError.invalidURL
        }
            // fetch data using URLSession
        let (data, _) = try await URLSession.shared.data(from: apiUrl)
            
            // parse returned api data
        let queryResult = try JSONDecoder().decode(CastCrewResponse.self, from: data)
       // print(queryResult)
        return queryResult
        
    }
    
    func getCreditsDetailLoader(movieId: Int) async -> CastCrewResponse{
        do {
            let creditResponse = try await getCreditsDetail(movieId: movieId)
            let creditResult = creditResponse
            return creditResult
        } catch {
           // print("Error with Movie Results Searching")
            debugPrint(error)
            return CastCrewResponse()
        }
    }
    
    func getMovieReccomendations(movieId: Int) async throws -> MovieSearchResponse {
        //print("Successfully Entered Search Function")
        // query url
        let url = "https://api.themoviedb.org/3/movie/" + String(movieId) + "/recommendations?api_key=" + self.apiKey! + "&language=en-US&page=1"
       // print(url)
        guard let apiUrl = URL(string: url) else {
           // print("Error with URL")
            throw MovieResponseManagerError.invalidURL
        }
            // fetch data using URLSession
        let (data, _) = try await URLSession.shared.data(from: apiUrl)
            
            // parse returned api data
        let queryResult = try JSONDecoder().decode(MovieSearchResponse.self, from: data)
       // print(queryResult)
        return queryResult
        
    }
    
    func getMovieReccomendationLoader(movieId: Int) async -> [IndividualMovieResponse] {
        do {
            let movieReponse = try await getMovieReccomendations(movieId: movieId)
            let movieResults = movieReponse.results
            return movieResults
        } catch {
            //print("Error with Movie Results Searching")
            debugPrint(error)
            return []
        }
    }
    
}


var requestManager = MovieResponseManager() 


