//
//  MoviesViewController.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import UIKit

class MoviesViewController: UIViewController {
    
    let rootView = MoviesRootView()
    
    var mainNavigation: MainNavigationController {
        navigationController as! MainNavigationController
    }
    
    let viewModel: MoviesViewModel
    init(viewModel: MoviesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = NSLocalizedString("Movies", comment: "")
        setupViewModelBindings()
        rootView.setupViewModel(viewModel)
        
        Task {
            try await viewModel.loadMovies()
        }
    }
    
    private func setupViewModelBindings() {
        viewModel.movieSelectionHandler = { [weak self] movie in
            self?.mainNavigation.showMovieDetails(movieId: movie.id)
        }
    }
}
