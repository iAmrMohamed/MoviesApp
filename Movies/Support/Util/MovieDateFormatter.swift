//
//  MovieDateFormatter.swift
//  Movies
//
//  Created by Amr Mohamed on 11/11/2023.
//

import Foundation

struct MovieDateFormatter {
    private var apiDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd"
        return formatter
    }()
    
    private var appDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()
    
    func convert(apiDate: String) -> String? {
        guard let date = apiDateFormatter.date(from: apiDate) else {
            return nil
        }
        
        return appDateFormatter.string(from: date)
    }
}
