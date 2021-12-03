//
//  TopRatedViewModel.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/14/21.
//

import Foundation

class TopRatedViewModel : ObservableObject {
    @Published var topRatedMovies : [IndividualMovieResponse]
    
    private var currentPage = 1
    private var apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    enum TopRatedViewModelError : Error {
        case invalidUrl
        case missingData
    }
    
    init() {
        topRatedMovies = []
        Task {
            await self.getMoviesLoader()
        }
    }
    
    func getMovies() async throws {
        let endpoint_url = "https://api.themoviedb.org/3/movie/top_rated?api_key=\(self.apiKey!)&language=en-US&page=\(self.currentPage)"
        //print(endpoint_url)
        guard let url = URL(string: endpoint_url) else {
            throw TopRatedViewModelError.invalidUrl
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let queryResult = try JSONDecoder().decode(MovieSearchResponse.self, from: data)
        DispatchQueue.main.async {
            //print(queryResult)
            if !self.topRatedMovies.isEmpty {
                self.topRatedMovies.append(contentsOf: queryResult.results)
            } else {
                self.topRatedMovies = queryResult.results
            }
            self.currentPage = self.currentPage + 1
        }
    }
    
    func getMoviesLoader() async {
        do {
            try await self.getMovies()
        } catch {
            debugPrint(error)
        }
    }
    
    func getTopRatedMovies() -> [IndividualMovieResponse] {
        return self.topRatedMovies
    }
    
    
}
