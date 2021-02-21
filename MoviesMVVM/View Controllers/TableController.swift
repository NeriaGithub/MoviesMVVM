//
//  TableController.swift
//  MoviesMVVM
//
//  Created by Neria Jerafi on 18/02/2021.
//

import Foundation
import UIKit

protocol TableControllerDelegate:class {
    func selectedMovie(atIndex: Int)
}

class TableController: NSObject {
  private  let tableView:UITableView
    var movieListVM:MovieListViewModel?
    private weak var delegate:TableControllerDelegate?
    
    init(tableView:UITableView, delegate:TableControllerDelegate) {
        self.tableView = tableView
        self.delegate = delegate
        super.init()
        tableConfigure()
    }
    
    func tableConfigure() {
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MovieCell.nib(), forCellReuseIdentifier: MovieCell.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension TableController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  movieListVM?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.cellIdentifier, for: indexPath) as! MovieCell
        cell.movieVM = movieListVM?.getMovieModelAt(index: indexPath.row)
        return cell
    }
}

extension TableController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectedMovie(atIndex: indexPath.row)
        }
       
    }

