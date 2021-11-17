//
//  UpcomingViewModel.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/14/21.
//

import Foundation

class UpcomingViewModel : ObservableObject {
    @Published private var upcomingMovies : [IndividualMovieResponse]
    
    enum UpcomingViewModelError : Error {
        case invalidUrl
        case missingData 
    }
    
    private var currentPage = 1
    private var apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    init() {
        upcomingMovies = []
        Task {
            await getMoviesLoader()
        }
    }
    
    func getMovies() async throws {
        let endpoint_url = "https://api.themoviedb.org/3/movie/upcoming?api_key=\(self.apiKey!)&language=en-US&page=\(self.currentPage)"
        //print(endpoint_url)
        guard let url = URL(string: endpoint_url) else {
            throw UpcomingViewModelError.invalidUrl
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let queryResult = try JSONDecoder().decode(NowPlayingResponse.self, from: data)
        DispatchQueue.main.async {
            //print(queryResult)
            if !self.upcomingMovies.isEmpty {
                self.upcomingMovies.append(contentsOf: queryResult.results)
            } else {
                self.upcomingMovies = queryResult.results
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
    
    func getUpcomingMovies() -> [IndividualMovieResponse] {
        return upcomingMovies
    }
}
