//
//  MovieReviewViewModel.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/16/21.
//

import Foundation

class MovieReviewViewModel : ObservableObject {
    @Published private var movieReviews : [ReviewResults]
    
    private var movieId : Int
    private var apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    
    enum MoviewReviewViewModelError : Error {
        case invalidUrl
        case missingData
    }
    
    init(movieId : Int? = nil) {
        if let id = movieId {
            self.movieId = id
            self.movieReviews = []
            Task {
                await getMovieReviewsLoader()
            }
        } else {
            self.movieId = -1
            self.movieReviews = []
        }
    }
    
    func update(movieId: Int) {
        self.movieId = movieId
        Task {
            await getMovieReviewsLoader()
        }
    }
    
    func getMovieReviews() async throws  {
        //print("Successfully Entered Search Function")
        // query url
        let url = "https://api.themoviedb.org/3/movie/" + String(self.movieId) + "/reviews?api_key=" + self.apiKey! + "&language=en-US&page=1"
        print(url)
        guard let apiUrl = URL(string: url) else {
           print("Error with URL")
            throw MoviewReviewViewModelError.invalidUrl
        }
            // fetch data using URLSession
        let (data, _) = try await URLSession.shared.data(from: apiUrl)

            // parse returned api data
        let queryResult = try JSONDecoder().decode(MovieReviewResponse.self, from: data)
        print(queryResult)
        DispatchQueue.main.async {
            if !self.movieReviews.isEmpty {
                self.movieReviews.append(contentsOf: queryResult.results)
            } else {
                self.movieReviews = queryResult.results
            }
        }
    }

    func getMovieReviewsLoader() async {
        do {
            try await getMovieReviews()
        } catch {
            //print("Error with Movie Results Searching")
            debugPrint(error)
        }
    }
    
    func getReviews() -> [ReviewResults] {
        return movieReviews
    }
    
    
    
}
