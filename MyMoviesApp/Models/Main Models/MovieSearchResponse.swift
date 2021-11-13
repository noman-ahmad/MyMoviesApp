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

struct IndividualMovieResponse: Decodable, Equatable {
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
        adult = false
        backdrop_path =  nil
        budget = -1
        genres = []
        homepage = nil
        id = -1
        imdb_id = nil
        original_language = ""
        original_title = ""
        overview = nil
        popularity = -1
        poster_path = nil
        production_companies = []
        production_countries = []
        release_date = ""
        revenue = -1
        runtime = nil
        spoken_languages = []
        status = ""
        tagline = nil
        title = ""
        video  = false
        vote_average = -1
        vote_count = -1
    }
}

