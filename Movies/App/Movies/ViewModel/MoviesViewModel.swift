//
//  MoviesViewModel.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import Foundation
import Combine
import TMDBService

@MainActor
class MoviesViewModel {
    @Published private(set) var isLoading = false
    @Published private(set) var movies = [MovieCellViewModel]()
    
    private var observers = Set<AnyCancellable>()
    
    var movieSelectionHandler: ((_ movie: MovieCellViewModel) -> Void)?
    
    let moviesService: TMDBServiceRepository
    init(moviesService: TMDBServiceRepository) {
        self.moviesService = moviesService
    }
    
    public func loadMovies() async throws {
        isLoading = true
        
        let movies = try await moviesService.loadMovies().map {
            MovieCellViewModel(
                id: $0.id,
                title: $0.title,
                release_date: $0.release_date,
                poster_path: $0.poster_path
            )
        }
        
        self.movies = movies
        isLoading = false
    }
}

extension MoviesViewModel {
    func select(movie: MovieCellViewModel) {
        movieSelectionHandler?(movie)
    }
}
