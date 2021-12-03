//
//  NowPlayingViewModel.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/14/21.
//

import Foundation


class NowPlayingViewModel : ObservableObject {
    @Published var moviesNowPlaying : [IndividualMovieResponse]
    private var currentPage = 1
    private var apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    enum NowPlayingViewModelError : Error {
        case invalidUrl
        case missingData
    }
    
    init() {
        moviesNowPlaying = []
        Task {
            await getMoviesLoader()
        }
    }
    
    
    func getMovies() async throws {
        if self.currentPage < 3 {
            let endpoint_url = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(self.apiKey!)&language=en-US&page=\(self.currentPage)"
            guard let url = URL(string: endpoint_url) else {
                throw NowPlayingViewModelError.invalidUrl
            }
            let (data, _) = try await URLSession.shared.data(from: url)
            let queryResult = try JSONDecoder().decode(NowPlayingResponse.self, from: data)
            DispatchQueue.main.async {
                if !self.moviesNowPlaying.isEmpty {
                    self.moviesNowPlaying.append(contentsOf: queryResult.results)
                } else {
                    self.moviesNowPlaying = queryResult.results
                }
                self.currentPage = self.currentPage + 1
            }
        }
    }
    
    
    func getMoviesLoader() async {
        do {
           try await getMovies()
        } catch {
            debugPrint(error)
        }
    }
    
    
    func getMoviesNowPlaying() -> [IndividualMovieResponse] {
        return moviesNowPlaying
    }
    
}
