//
//  PopularMoviesViewModel.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/14/21.
//

import Foundation

class PopularViewModel : ObservableObject {
    @Published private var popularMovies : [IndividualMovieResponse]
    
    private var currentPage = 1
    private var apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    enum PopularViewModelError : Error {
        case invalidUrl
        case missingData
    }
    
    init() {
        popularMovies = []
        Task {
            await self.getMoviesLoader()
        }
    }
    
    func getMovies() async throws {
        let endpoint_url = "https://api.themoviedb.org/3/movie/popular?api_key=\(self.apiKey!)&language=en-US&page=\(self.currentPage)"
        print(endpoint_url)
        guard let url = URL(string: endpoint_url) else {
            throw PopularViewModelError.invalidUrl
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let queryResult = try JSONDecoder().decode(MovieSearchResponse.self, from: data)
        DispatchQueue.main.async {
            print(queryResult)
            if !self.popularMovies.isEmpty {
                self.popularMovies.append(contentsOf: queryResult.results)
            } else {
                self.popularMovies = queryResult.results
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
    
    func getPopularMovies() -> [IndividualMovieResponse] {
        return self.popularMovies
    }
    
}
