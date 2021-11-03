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
    let release_date : String
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
}

struct IndividualMovieDetailResponse: Decodable {
    internal init(adult: Bool, backdrop_path: String?, budget: Int, genres: [GenreResponse], homepage: String?, id: Int, imdb_id: Int?, original_language: String, original_title: String, overview: String?, popularity: Float, poster_path: String?, production_companies: [ProductionCompanyResponse], production_countries: [ProductionCountryResponse], release_date: String, revenue: Int, runtime: Int?, spoken_languages: [SpokenLanguageResponse], status: String, tagline: String?, title: String, video: Bool, vote_average: Float, vote_count: Int) {
        
        self.adult = adult
        self.backdrop_path = backdrop_path
        self.budget = budget
        self.genres = genres
        self.homepage = homepage
        self.id = id
        self.imdb_id = imdb_id
        self.original_language = original_language
        self.original_title = original_title
        self.overview = overview
        self.popularity = popularity
        self.poster_path = poster_path
        self.production_companies = production_companies
        self.production_countries = production_countries
        self.release_date = release_date
        self.revenue = revenue
        self.runtime = runtime
        self.spoken_languages = spoken_languages
        self.status = status
        self.tagline = tagline
        self.title = title
        self.video = video
        self.vote_average = vote_average
        self.vote_count = vote_count
    }
    
    let adult: Bool
    let backdrop_path: String?
    let budget : Int
    let genres: [GenreResponse]
    let homepage: String?
    let id: Int
    let imdb_id: Int?
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
}

