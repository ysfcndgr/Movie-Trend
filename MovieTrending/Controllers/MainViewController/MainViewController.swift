//
//  MainViewController.swift
//  MovieTrending
//
//  Created by Can on 30.01.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: MainViewModel = MainViewModel()
    
    var cellDataSource: [MovieTableCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        bindViewModel()
    }

    func configView(){
        self.title = "Main View"
        self.view.backgroundColor = .red
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    func bindViewModel(){
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else { return }
            
            DispatchQueue.main.async{
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
            
        }
        
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self, let movies = movies else { return }
            self.cellDataSource = movies
            self.reloadTableView()
        }
    }
    
    func openDetail(movieId: Int) {
        guard let movie = viewModel.retriveMovie(with: movieId) else { return }
        
        let detailsViewModel = DetailsMovieViewModel(movie: movie)
        let detailsController = DetailsMovieViewController(viewModel: detailsViewModel)
        DispatchQueue.main.async{
            self.navigationController?.pushViewController(detailsController, animated: true)
            
        }
    }
    
}
