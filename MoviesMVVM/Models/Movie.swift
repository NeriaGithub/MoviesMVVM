//
//  Movie.swift
//  MoviesMVVM
//
//  Created by Neria Jerafi on 18/02/2021.
//

import Foundation

struct Movie:Decodable {
    let title:String
    let image:String
    let rating:Double
    let releaseYear:Int
    let genre:[String]
}
