//
//  MovieDetailsRootView.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import UIKit
import Combine

class MovieDetailsRootView: UIView {
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    private var observers = Set<AnyCancellable>()
    private(set) var viewModel: MovieDetailsViewModel?
    private var fetchImageTask: Task<UIImage?, Error>?
    
    public func setupViewModel(_ viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        
        viewModel.$movieDetails.compactMap {
            $0
        }.receive(on: DispatchQueue.main).sink { [weak self] details in
            guard let self = self else { return }
            updateViews(with: details)
        }.store(in: &observers)
        
        viewModel.$isLoading.receive(
            on: DispatchQueue.main
        ).sink { [weak self] isLoading in
            guard let self = self else { return }
            scrollView.isHidden = isLoading
            
            if isLoading {
                activityIndicator.startAnimating()
            } else {
                activityIndicator.stopAnimating()
            }
        }.store(in: &observers)
    }
    
    private func updateViews(with details: MovieDetails) {
        titleLabel.text = details.title
        dateLabel.text = details.date
        descriptionLabel.text = details.overview
        
        Task {
            if let url = URL(string: details.imagePath) {
                try await setImage(url: url)
            }
        }
    }
    
    func setImage(url: URL) async throws {
        fetchImageTask = Task { () -> UIImage? in
            let (data, _) = try await URLSession.shared.data(from: url)
            try Task.checkCancellation()
            return UIImage(data: data)
        }
        
        let image = try await fetchImageTask?.value
        imageView.image = image
    }
}
