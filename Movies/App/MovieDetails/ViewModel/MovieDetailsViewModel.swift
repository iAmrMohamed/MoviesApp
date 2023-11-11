//
//  MovieDetailsViewModel.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import Foundation
import Combine
import TMDBService

class MovieDetailsViewModel {
    @Published private(set) var isLoading = false
    @Published private(set) var movieDetails: MovieDetails?
    
    private var observers = Set<AnyCancellable>()
    private let movieDateFormatter = MovieDateFormatter()
    
    let movieId: Int
    private let moviesService: TMDBServiceRepository
    init(movieId: Int, moviesService: TMDBServiceRepository) {
        self.movieId = movieId
        self.moviesService = moviesService
    }
    
    public func loadMovieDetails() async throws {
        isLoading = true
        
        let details = try await TMDBService().loadMovieDetail(movieId: movieId)
        
        self.movieDetails = MovieDetails(
            id: details.id,
            title: details.title,
            overview: details.overview,
            date: movieDateFormatter.convert(apiDate: details.release_date),
            imagePath: moviesService.imagesBaseUrl + details.backdrop_path
        )
        
        isLoading = false
    }
}
