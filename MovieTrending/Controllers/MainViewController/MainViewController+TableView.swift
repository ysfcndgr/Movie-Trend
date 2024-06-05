//
//  MainViewController+TableView.swift
//  MovieTrending
//
//  Created by Can on 30.01.2024.
//

import Foundation
import UIKit


extension MainViewController: UITableViewDataSource, UITableViewDelegate {

    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = .clear
        registerCells()

    }
    
    func reloadTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func registerCells(){
        let cellIdentifier = String(describing: MainMovieCell.self)
        let nib = UINib(nibName: cellIdentifier, bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MainMovieCell.self), for: indexPath) as? MainMovieCell else { return UITableViewCell() }
       
        let cellViewModel = cellDataSource[indexPath.row]
        
        cell.setupCell(viewModel: cellViewModel)
        

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieId = cellDataSource[indexPath.row].id
        self.openDetail(movieId: movieId)
        
    }
    
}
