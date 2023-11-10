//
//  MoviesViewModel.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import Foundation
import Combine

@MainActor
class MoviesViewModel {
    @Published private(set) var isLoading = false
    @Published private(set) var movies = [Movie]()
    
    private var observers = Set<AnyCancellable>()
    
    var movieSelectionHandler: ((_ movie: Movie) -> Void)?
    
    func loadMovies() async throws {
        movies = Self.testMovies
    }
}

extension MoviesViewModel {
    func select(movie: Movie) {
        movieSelectionHandler?(movie)
    }
}

extension MoviesViewModel {
    private static var testMovies: [Movie] = [
        .init(image: nil, title: "Test Movie 1", date: "1999"),
        .init(image: nil, title: "Test Movie 2", date: "1990"),
        .init(image: nil, title: "Test Movie 3", date: "1922"),
    ]
}
