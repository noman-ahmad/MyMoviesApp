//
//  LanguageResponse.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/2/21.
//

import Foundation

struct SpokenLanguageResponse: Decodable {
    let iso_639_1 : String
    let name : String
}
