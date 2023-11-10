//
//  MainNavigationController.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import UIKit

class MainNavigationController: UINavigationController {
    private let appDependency = AppDependencyContainer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainNavigationController: MovieSelectionResponder {
    func showMovieDetails(movie: Movie) {
        let details = appDependency.makeMovieDetailsViewController(movie: movie)
        pushViewController(details, animated: true)
    }
}
