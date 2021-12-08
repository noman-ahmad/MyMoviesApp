//
//  WatchProvidersResponse.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 12/5/21.
//

import Foundation



// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct WatchProviderResponse : Decodable {
    let id: Int
    let results : WatchProviderResultResponse
    
    init() {
        id = -1
        results = WatchProviderResultResponse()
    }
}

struct WatchProviderResultResponse : Decodable {
    let US : WatchProviderCountryResponse
    
    init() {
        US = WatchProviderCountryResponse()
    }
}


struct WatchProviderCountryResponse : Decodable {
    let link : String
    let flatrate : [WatchProviderTypeResponse]?
    let rent : [WatchProviderTypeResponse]?
    let buy :[WatchProviderTypeResponse]?
    
    init() {
        link = ""
        flatrate = []
        rent = []
        buy = []
    }
}

struct WatchProviderTypeResponse : Decodable {
    let display_priority : Int
    let logo_path : String
    let provider_id : Int
    let provider_name : String
    
    init() {
        display_priority = -1
        logo_path = ""
        provider_id = -1
        provider_name = ""
    }
}


