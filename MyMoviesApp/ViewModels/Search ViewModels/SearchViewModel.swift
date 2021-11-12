//
//  SearchViewModels.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/9/21.
//

import Foundation

class SearchViewModel : ObservableObject {
    @Published var movieResults : [SearchResult]
    
    enum SearchViewModelError : Error {
        case invalidURL
        case missingData
    }
    
    init() {
        movieResults = []
    }
    
    let endpoint_url = "https://imdb-api.com/en/API/SearchMovie/"
    
    let api_key =  "k_c276wx6s"
    
    func getSearchResults(queryString : String) async throws {
        print("Successfully Entered Movie Search Function")
        
        let search_query = queryString.replacingOccurrences(of: " ", with: "%20")
        
        let api_url = endpoint_url + self.api_key + "/\(search_query)"
        
        print(api_url)
        
        guard let searchApi = URL(string: api_url) else {
            print("Error with URL")
            throw SearchViewModelError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: searchApi)
        
        let queryResult = try JSONDecoder().decode(SearchData.self, from: data)
        print(queryResult)
        DispatchQueue.main.async {
            if !self.movieResults.isEmpty{
                self.movieResults.removeAll()
                self.movieResults = queryResult.results
            } else {
                self.movieResults = queryResult.results
            }
        }
    }
    
    
    func getSearchResultsLoader(queryString: String) async {
        do {
            try await getSearchResults(queryString: queryString)
        } catch {
            debugPrint(error)
        }
    }
}
