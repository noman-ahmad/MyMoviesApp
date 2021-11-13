//
//  MovieReviewResponse.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/12/21.
//

import Foundation


struct MovieReviewResponse : Codable {
    let id: Int
    let page: Int
    let results : [ReviewResults]
    let total_pages : Int
    let total_results : Int 
}

struct ReviewResults : Codable {
    let author : String
    let author_details : AuthorDetails
    let content : String
    let created_at : String
    let id: String
    let updated_at : String
    let url : String
}


struct AuthorDetails : Codable {
    let name : String
    let username : String
    let avatar_path : String?
    let rating : Int?
}
