//
//  APIRequestLoader.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import Foundation

struct APIRequestLoader: APIRequestLoading {
    var session: NetworkingSession = URLSession.shared
    
    func load<T>(request: APIRequestConvertible, ofType: T.Type) async throws -> T where T : Decodable {
        let (data, response) = try await session.data(for: try request.urlRequest())
        
        guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
            throw NetworkError.badStatusCode
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
