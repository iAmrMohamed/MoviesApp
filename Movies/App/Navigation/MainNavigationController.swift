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
    func showMovieDetails(movieId: Int) {
        let details = appDependency.makeMovieDetailsViewController(movieId: movieId)
        pushViewController(details, animated: true)
    }
}
