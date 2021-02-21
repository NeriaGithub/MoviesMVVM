//
//  MovieViewController.swift
//  MoviesMVVM
//
//  Created by Neria Jerafi on 18/02/2021.
//

import UIKit

class MovieViewController: UIViewController {
    var movieVM:MovieViewModel?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitVC()
    }
    
    func configureInitVC() {
    guard let unwrappedMovieVM = movieVM else { return }
    titleLabel.text = unwrappedMovieVM.title
    movieImage.load(StringURL: unwrappedMovieVM.image)
    ratingLabel.text = unwrappedMovieVM.rating
    releaseYearLabel.text = unwrappedMovieVM.releaseYear
    genreLabel.text = unwrappedMovieVM.genre
    }
    


}
