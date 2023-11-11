//
//  APIMovieDetails.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import Foundation

public struct APIMovieDetails: Decodable {
    public let id: Int
    public let title: String
    public let overview: String
    public let release_date: String
    public let backdrop_path: String
}
