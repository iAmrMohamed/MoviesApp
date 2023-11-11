//
//  MovieCell.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import UIKit

class MovieCell: UICollectionViewCell {
    static let reuseIdentifier = "MovieCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    private var fetchImageTask: Task<UIImage?, Error>?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // this is important for the image loading task to cancel if the cell will be reused
        fetchImageTask?.cancel()
        imageView.image = nil
    }
    
    func setImage(url: URL) async throws -> UIImage? {
        fetchImageTask = Task { () -> UIImage? in
            let (data, _) = try await URLSession.shared.data(from: url)
            try Task.checkCancellation()
            return UIImage(data: data)
        }
        
        let image = try await fetchImageTask?.value
        imageView.image = image
        
        return image
    }
}
