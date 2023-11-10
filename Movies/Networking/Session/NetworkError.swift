//
//  NetworkError.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import Foundation

enum NetworkError: LocalizedError {
    case badURL
    case badStatusCode
    
    public var errorDescription: String? {
        switch self {
        case .badURL:
            return NSLocalizedString("Bad URL", comment: "Network Error")
        case .badStatusCode:
            return NSLocalizedString("Request finished with a bad status code", comment: "Network Error")
        }
    }
}
