//
//  DetailsMovieViewModel.swift
//  MovieTrending
//
//  Created by Can on 4.02.2024.
//

import Foundation

class DetailsMovieViewModel {
    var movie: Movie
    var movieImage: URL?
    var movieTitle: String
    var movieDescription: String
    var movieID: Int
    
    init(movie: Movie) {
        self.movie = movie
        self.movieID = movie.id
        self.movieDescription = movie.overview ?? ""
        self.movieTitle = movie.original_title ?? movie.original_name ?? ""
        self.movieImage = makeImageURL(movie.poster_path ?? "")
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
