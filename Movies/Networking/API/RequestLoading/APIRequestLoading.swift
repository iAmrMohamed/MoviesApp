//
//  APIRequestLoading.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import Foundation

protocol APIRequestLoading {
    var session: NetworkingSession { get set }
    func load<T: Decodable>(request: APIRequestConvertible, ofType: T.Type) async throws -> T
}
