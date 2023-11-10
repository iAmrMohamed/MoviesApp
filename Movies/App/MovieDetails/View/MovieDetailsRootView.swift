//
//  MovieDetailsRootView.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import UIKit
import Combine

class MovieDetailsRootView: UIView {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    private var observers = Set<AnyCancellable>()
    private(set) var viewModel: MovieDetailsViewModel?
    
    public func setupViewModel(_ viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        
        viewModel.$movieDetails.compactMap {
            $0
        }.sink { [weak self] details in
            guard let self = self else { return }
            updateViews(with: details)
        }.store(in: &observers)
    }
    
    private func updateViews(with details: MovieDetails) {
        titleLabel.text = details.title
        dateLabel.text = details.date
        descriptionLabel.text = details.description
    }
}
