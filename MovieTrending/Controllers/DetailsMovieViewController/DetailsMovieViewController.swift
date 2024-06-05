//
//  DetailsMovieViewController.swift
//  MovieTrending
//
//  Created by Can on 4.02.2024.
//

import UIKit
import SDWebImage

class DetailsMovieViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var viewModel: DetailsMovieViewModel
    
    init(viewModel: DetailsMovieViewModel){
        self.viewModel = viewModel
        super.init(nibName: "DetailsMovieViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()

    }
    
    func configView(){
        self.titleLabel.text = viewModel.movieTitle
        self.descriptionLabel.text = viewModel.movieDescription
        imageView.sd_setImage(with: viewModel.movieImage)
    }


}
