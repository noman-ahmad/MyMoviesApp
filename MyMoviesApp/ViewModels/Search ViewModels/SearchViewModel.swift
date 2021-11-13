//
//  SearchViewModel.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/11/21.
//

import Foundation

class SearchViewModel : ObservableObject {
    @Published private var movieResults : [IndividualMovieResponse]
    
    private var apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    private var currentPage = 1
    
    
    enum SearchViewModelError : Error {
        case invalidURL
        case missingData
    }
    
    init() {
        movieResults = []
    }
    
        func getSearchResults(queryString: String) async throws {
            //print("Successfully Entered Search Function")
            
            let search_query = queryString.replacingOccurrences(of: " ", with: "%20")
            
            
            // query url
            let url = "https://api.themoviedb.org/3/search/movie?api_key=\(self.apiKey!)&language=en-US&query=\(search_query)&page=\(currentPage)&include_adult=false"
            print(url)
            guard let apiUrl = URL(string: url) else {
                //print("Error with URL")
                throw SearchViewModelError.invalidURL
            }
                // fetch data using URLSession
            let (data, _) = try await URLSession.shared.data(from: apiUrl)
    
                // parse returned api data
            let queryResult = try JSONDecoder().decode(MovieSearchResponse.self, from: data)
            print(queryResult)
            DispatchQueue.main.async {
                if !self.movieResults.isEmpty {
                    self.movieResults.append(contentsOf: queryResult.results)
                } else {
                    self.movieResults = queryResult.results
                }
                self.currentPage = self.currentPage + 1
            }
                
        }
    
    func getSearchResultsLoader(queryString: String) async {
        do {
            try await getSearchResults(queryString: queryString)
        } catch {
            debugPrint(error)
        }
    }
    
    func removeAllMovies() {
        self.movieResults.removeAll()
        self.currentPage = 1
    }
    
    func getMovieDate(movie: IndividualMovieResponse) -> String {
        
        
        if let date = movie.release_date {
            return String(date.prefix(4))
        } else {
            return ""
        }
    }
    
    func getMoviePosterURL(movie: IndividualMovieResponse) -> String {
        
        if let poster_path = movie.poster_path {
            return "https://image.tmdb.org/t/p/w200/\(poster_path)"
        } else {
            return ""
        }
    }
    
    func getMovieId(movie: IndividualMovieResponse) -> Int {
        return movie.id
    }
    
    
    func getMovies() -> [IndividualMovieResponse] {
        return movieResults
    }
    
}
