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
    
    func makeMovieDetailsViewModel(movieId: Int) -> MovieDetailsViewModel {
        MovieDetailsViewModel(movieId: movieId)
    }
    
    func makeMovieDetailsViewController(movieId: Int) -> MovieDetailsViewController {
        MovieDetailsViewController(viewModel: makeMovieDetailsViewModel(movieId: movieId))
    }
}
