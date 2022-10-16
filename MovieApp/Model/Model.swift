//
//  Model.swift
//  MovieApp
//
//  Created by Sevval Alev on 28.09.2022.
//

import UIKit

struct MovieData: Decodable {
    let results : [Result]  
}

struct Result: Decodable {
    let original_title : String
    let release_date : String
    let overview : String
    let vote_average : Double
    let poster_path : String

    var voteString: String {
        return String(format: "%.1f", vote_average)
    }
    

}


