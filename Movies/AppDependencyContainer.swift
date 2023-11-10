//
//  AppDependencyContainer.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import Foundation

@MainActor
class AppDependencyContainer {
    func makeRootViewController() -> MainNavigationController {
        MainNavigationController(rootViewController: makeMoviesViewController())
    }
    
    func makeMoviesViewModel() -> MoviesViewModel {
        MoviesViewModel()
    }
    
    func makeMoviesViewController() -> MoviesViewController {
        MoviesViewController(viewModel: makeMoviesViewModel())
    }
    
    func makeMovieDetailsViewModel(movie: Movie) -> MovieDetailsViewModel {
        MovieDetailsViewModel(movie: movie)
    }
    
    func makeMovieDetailsViewController(movie: Movie) -> MovieDetailsViewController {
        MovieDetailsViewController(viewModel: makeMovieDetailsViewModel(movie: movie))
    }
}
