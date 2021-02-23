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
    @IBOutlet weak var searchBar: UISearchBar!{
        didSet{
            searchBar.delegate = self
        }
    }
    private var tableController:TableController!
    private var selectedIndex:Int = 0
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureInit()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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

extension MovieListViewController:UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        tableController.movieListVM?.filterMovies(text: searchBar.text!)
        movieListTableView.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            tableController.movieListVM?.filterMovies()
            movieListTableView.reloadData()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}


