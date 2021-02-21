//
//  MovieListViewController.swift
//  MoviesMVVM
//
//  Created by Neria Jerafi on 18/02/2021.
//

import UIKit

class MovieListViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var movieListTableView: UITableView!
    private var tableController:TableController!
    private var selectedIndex:Int = 0
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureInit()
    }
    
    private func ConfigureInit(){
        tableController = TableController(tableView: movieListTableView, delegate: self)
        tableController.movieListVM = MovieListViewModel()
        tableController.movieListVM?.fetchMovies(completion: {
            self.movieListTableView.reloadData()
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movieSegue" {
            let destinationVC = segue.destination as! MovieViewController
            destinationVC.movieVM  = tableController.movieListVM?.getMovieModelAt(index: selectedIndex)
        }
    }
}


extension MovieListViewController:TableControllerDelegate{
    func selectedMovie(atIndex index: Int) {
        selectedIndex = index
        performSegue(withIdentifier: "movieSegue", sender: self)
    }
}


