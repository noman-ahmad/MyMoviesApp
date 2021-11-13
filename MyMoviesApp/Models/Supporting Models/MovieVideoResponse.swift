//
//  MovieVideoResponse.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/12/21.
//

import Foundation


struct MovieVideoResponse : Codable {
    let id: Int
    let results : [VideoResult]
}

struct VideoResult : Codable {
    let iso_639_1 : String
    let iso_3166_1 : String
    let name : String
    let key : String
    let site : String
    let size : Int
    let type: String
    let official : Bool
    let published_at : String
    let id: String
}
