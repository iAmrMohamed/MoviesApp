//
//  NetworkingSession.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import Foundation

import Foundation

public protocol NetworkingSession {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: NetworkingSession {}
