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
    let date: String?
    let imagePath: String
    
    init(id: Int, title: String, overview: String, date: String?, imagePath: String) {
        self.id = id
        self.title = title
        self.overview = overview
        self.date = date
        self.imagePath = imagePath
    }
}
