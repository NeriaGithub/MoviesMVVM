//
//  MovieCell.swift
//  MoviesMVVM
//
//  Created by Neria Jerafi on 18/02/2021.
//

import UIKit

class MovieCell: UITableViewCell {
    static let cellIdentifier = "MovieCell"
    static func nib()->UINib{
        return UINib(nibName: cellIdentifier, bundle: nil)
    }
    var movieVM:MovieViewModel?{
        didSet{
            if let unwrappedMovieVM = movieVM {
                titleLabel.text = unwrappedMovieVM.title
                releaseYearLabel.text = unwrappedMovieVM.releaseYear
                movieImage.load(StringURL: unwrappedMovieVM.image)
            }
        }
    }
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    
    
}



