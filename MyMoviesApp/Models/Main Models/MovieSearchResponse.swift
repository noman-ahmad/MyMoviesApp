//
//  MovieSearchResponse.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/2/21.
//

import Foundation
import SwiftUI

struct MovieSearchResponse: Decodable {
    let page : Int
    let results : [IndividualMovieResponse]
    let total_results : Int
    let total_pages : Int
}

struct IndividualMovieResponse: Decodable {
    let poster_path : String?
    let adult : Bool
    let overview : String
    let release_date : String?
    let genre_ids : [Int]
    let id : Int
    let original_title : String
    let original_language : String
    let title : String
    let backdrop_path : String?
    let popularity : Float
    let vote_count : Int
    let video : Bool
    let vote_average : Float
    
    init() {
        poster_path = nil
        adult = false
        overview = ""
        release_date = nil
        genre_ids = []
        id = -1
        original_title = ""
        original_language = ""
        title = ""
        backdrop_path = nil
        popularity = -1
        vote_count = -1
        video = false
        vote_average = -1
    }
}

struct IndividualMovieDetailResponse: Decodable {
    let adult: Bool
    let backdrop_path: String?
    let budget : Int
    let genres: [GenreResponse]
    let homepage: String?
    let id: Int
    let imdb_id: String?
    let original_language : String
    let original_title : String
    let overview : String?
    let popularity: Float
    let poster_path: String?
    let production_companies : [ProductionCompanyResponse]
    let production_countries : [ProductionCountryResponse]
    let release_date : String
    let revenue : Int
    let runtime: Int?
    let spoken_languages : [SpokenLanguageResponse]
    let status : String
    let tagline : String?
    let title : String
    let video : Bool
    let vote_average: Float
    let vote_count : Int
    
    
    init() {
        self.adult = false
        self.backdrop_path = nil
        self.budget = -1
        self.genres = []
        self.homepage = nil
        self.id = -1
        self.imdb_id = nil
        self.original_language = ""
        self.original_title = ""
        self.overview = nil
        self.popularity = -1
        self.poster_path = nil
        self.production_companies = []
        self.production_countries = []
        self.release_date = ""
        self.revenue = -1
        self.runtime = -1
        self.spoken_languages = []
        self.status = ""
        self.tagline = nil
        self.title = ""
        self.video = false
        self.vote_average = -1
        self.vote_count = -1
    }
    
}

