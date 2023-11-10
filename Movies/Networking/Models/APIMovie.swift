//
//  APIMovie.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import Foundation

struct APIMovie: Decodable {
    let id: Int
    let title: String
    let overview: String
    let release_date: String
    let poster_path: String
    let backdrop_path: String
}
