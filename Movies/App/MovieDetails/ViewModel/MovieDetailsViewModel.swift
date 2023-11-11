//
//  MovieDetailsViewModel.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import Foundation
import Combine

class MovieDetailsViewModel {
    @Published private(set) var isLoading = false
    @Published private(set) var movieDetails: MovieDetails?
    
    private var observers = Set<AnyCancellable>()
    
    let movieId: Int
    init(movieId: Int) {
        self.movieId = movieId
    }
    
    public func loadMovieDetails() async throws {
        isLoading = true
        
        let details = try await TMDBService().loadMovieDetail(movieId: movieId)
        
        self.movieDetails = MovieDetails(
            id: details.id,
            title: details.title,
            overview: details.overview,
            release_date: details.release_date,
            backdrop_path: details.backdrop_path
        )
        
        isLoading = false
    }
}
