//
//  MovieViewModel.swift
//  MoviesMVVM
//
//  Created by Neria Jerafi on 18/02/2021.
//

import Foundation

class MovieViewModel {
    let movieModel:MovieModel
    init(with movieModel:MovieModel) {
        self.movieModel = movieModel
    }
    var title: String {
        return "Name: \(movieModel.title ?? "")"
    }
    var image:String{
        return movieModel.image ?? ""
    }
    var rating: String {
        return "Rating: \(movieModel.rating)"
    }
    var genre: String {
        var  result = ""
        if let unwrappedGenre = movieModel.genre {
            result = unwrappedGenre.joined(separator: ",")
        }
        return result
    }
    var releaseYear: String {
        return "Release Year: \(movieModel.releaseYear)"
    }
    
}
