//
//  MovieListViewModel.swift
//  MoviesMVVM
//
//  Created by Neria Jerafi on 18/02/2021.
//

import Foundation

class MovieListViewModel {
    var movieModelArray:[MovieModel] = []
//    init(with movies:[Movie]) {
//        CoreDataManager.shared.create(movieArray: movies)
//        CoreDataManager.shared.read()
//        movieModelArray = CoreDataManager.shared.movies
//    }
//    init() {
//        CoreDataManager.shared.read()
//        movieModelArray = CoreDataManager.shared.movies
//    }
    
    func fetchMovies(completion:@escaping()->()){
        if CoreDataManager.shared.coreDataIsEmpty() {
            WebService.getRequest {[weak self] (result:Result<[Movie],WebServiceError>) in
                guard let strongSelf = self else { return }
                switch result {
                case .success(let movies):
                    CoreDataManager.shared.create(movieArray: movies)
                    CoreDataManager.shared.read()
                    strongSelf.movieModelArray = CoreDataManager.shared.movies
                    completion()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        } else {
            CoreDataManager.shared.read()
            movieModelArray = CoreDataManager.shared.movies
            completion()
        }
    }
    var count: Int {
        return movieModelArray.count
    }
    func getMovieModelAt(index:Int) -> MovieViewModel {
        return MovieViewModel(with: movieModelArray[index])
    }
}
