//
//  ProductionCompanyResponse.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/2/21.
//

import Foundation

struct ProductionCompanyResponse: Decodable {
    let name: String
    let id: Int
    let logo_path : String?
    let origin_country : String
}

struct ProductionCountryResponse: Decodable {
    let iso_3166_1 : String?
    let name: String
}
