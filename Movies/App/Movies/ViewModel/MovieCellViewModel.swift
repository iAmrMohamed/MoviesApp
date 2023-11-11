//
//  MovieCellViewModel.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import Foundation
import TMDBService

struct MovieCellViewModel: Equatable, Hashable {
    let id: Int
    let title: String
    let date: String?
    let imagePath: String
    
    init(id: Int, title: String, date: String?, imagePath: String) {
        self.id = id
        self.title = title
        self.date = date
        self.imagePath = imagePath
    }
}
