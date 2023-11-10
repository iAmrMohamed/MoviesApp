//
//  MovieDetailsViewController.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var rootView: MovieDetailsRootView {
        view as! MovieDetailsRootView
    }
    
    let viewModel: MovieDetailsViewModel
    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
