//
//  MovieTableCellViewModel.swift
//  MovieTrending
//
//  Created by Can on 31.01.2024.
//

import Foundation

final class MovieTableCellViewModel {
    var id: Int
    var title: String
    var date: String
    var rating: String
    var imageUrl: URL?
    
    init(movie: Movie){
        self.id = movie.id
        self.title = movie.original_title ?? movie.original_name ?? ""
        self.date = movie.release_date ?? ""
        self.rating = "\(movie.vote_average)/10"
        self.imageUrl = makeImageURL(movie.poster_path ?? "")
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
    
}
