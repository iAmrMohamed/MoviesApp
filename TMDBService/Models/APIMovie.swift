//
//  APIMovie.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import Foundation

public struct APIMovie: Decodable {
    public let id: Int
    public let title: String
    public let release_date: String
    public let poster_path: String
}
