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
    
    let movie: Movie
    init(movie: Movie) {
        self.movie = movie
    }
}
