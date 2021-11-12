//
//  MovieSearchResults.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/9/21.
//

import Foundation



enum SearchType: Int {
    case Title = 1, Movie = 2, Series = 4, Name = 8, Episode = 16, Company = 32, Keyword = 64, All = 128
}


struct SearchResult: Codable, Hashable {
    let id : String
    let resultType : String
    let image : String
    let title : String
    let description : String
}


struct SearchData : Codable, Hashable {
    let searchType : String
    let expression : String
    let results : [SearchResult]
    let errorMessage : String
}
