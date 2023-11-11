//
//  MovieCellViewModel.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import Foundation

struct MovieCellViewModel: Equatable, Hashable {
    let id: Int
    let title: String
    let release_date: String
    private let poster_path: String
    
    var imagePath: String {
        TMDBAPI.imagesBaseUrl + "/w500" + poster_path
    }
    
    init(id: Int, title: String, release_date: String, poster_path: String) {
        self.id = id
        self.title = title
        self.release_date = release_date
        self.poster_path = poster_path
    }
}
