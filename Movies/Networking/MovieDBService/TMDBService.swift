//
//  TMDBService.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import Foundation

struct TMDBService: TMDBServiceRepository {
    // these are defined as variables to allow unit tests to inject them later easily
    var baseUrl: String = TMDBAPI.baseUrl
    var accessToken: String = TMDBAPI.accessToken
    var requestLoader: APIRequestLoading = APIRequestLoader()
}

extension TMDBService {
    struct MoviesBody: Decodable {
        let results: [APIMovie]
    }
    
    func loadMovies() async throws -> [APIMovie] {
        let request = APIRequest(
            baseURL: baseUrl,
            path: "/3/discover/movie",
            httpHeaderFields: ["Authorization": "Bearer \(accessToken)"]
        )
               
        let response = try await requestLoader.load(request: request, ofType: MoviesBody.self)
        return response.results
    }
}

extension TMDBService {
    func loadMovieDetail(movieId: Int) async throws -> APIMovieDetails {
        let request = APIRequest(
            baseURL: baseUrl,
            path: "/3/movie/\(movieId)",
            httpHeaderFields: ["Authorization": "Bearer \(accessToken)"]
        )
               
        return try await requestLoader.load(request: request, ofType: APIMovieDetails.self)
    }
}
