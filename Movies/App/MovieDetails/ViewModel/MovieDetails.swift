//
//  MovieDetails.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import Foundation

struct MovieDetails {
    let id: Int
    let title: String
    let overview: String
    let release_date: String
    private let backdrop_path: String
    
    var imagePath: String {
        TMDBAPI.imagesBaseUrl + "/w500" + backdrop_path
    }
    
    init(id: Int, title: String, overview: String, release_date: String, backdrop_path: String) {
        self.id = id
        self.title = title
        self.overview = overview
        self.release_date = release_date
        self.backdrop_path = backdrop_path
    }
}
