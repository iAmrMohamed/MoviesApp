//
//  TMDBServiceRepository.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import Foundation

protocol TMDBServiceRepository {
    var requestLoader: APIRequestLoading { get }
    
    func loadMovies() async throws -> [APIMovie]
    func loadMovieDetail(movieId: Int) async throws -> APIMovieDetails
}
