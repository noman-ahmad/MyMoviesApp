//
//  CastCrewResponse.swift
//  MyMoviesApp
//
//  Created by Noman Ahmad on 11/3/21.
//

import Foundation


struct CastResponse : Decodable {
    let adult : Bool
    let gender : Int?
    let id : Int
    let known_for_department : String
    let name : String
    let original_name : String
    let popularity : Float
    let profile_path : String?
    let cast_id : Int
    let character : String
    let credit_id : String
    let order : Int
}


struct CrewResponse : Decodable {
    let adult : Bool
    let gender : Int?
    let id : Int
    let known_for_department : String
    let name : String
    let original_name : String
    let popularity : Float
    let profile_path : String?
    let credit_id : String
    let department : String
    let job : String
}

struct CastCrewResponse : Decodable {
    let id: Int
    let cast : [CastResponse]
    let crew : [CrewResponse]
    
    
    init() {
        self.id = -1
        self.cast = []
        self.crew = [] 
    }
}
