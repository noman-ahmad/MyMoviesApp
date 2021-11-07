//
//  NowPlayingResponse.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/7/21.
//

import Foundation


struct NowPlayingResponse : Decodable{
    let page: Int
    let results : [IndividualMovieResponse]
    let dates : DateResponse
    let total_pages : Int
    let total_results : Int
}


struct DateResponse : Decodable {
    let maximum : String
    let minimum : String
}
