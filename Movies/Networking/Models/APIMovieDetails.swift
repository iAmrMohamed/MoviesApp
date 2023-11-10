//
//  APIMovieDetails.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import Foundation

/// for our case here I don't see any need for making
/// a movie details for the movie info, since the movie object already has all the info needed for our application use case
struct APIMovieDetails: Decodable {
    let id: Int
    let title: String
    let overview: String
    let release_date: String
    let poster_path: String
    let backdrop_path: String
}
