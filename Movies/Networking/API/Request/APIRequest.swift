//
//  APIRequest.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import Foundation

/// this is the least amount of abstraction to be made for our current use case
/// many other fields can be introduced here like params, url encoding, httpBody data and http header fields
struct APIRequest: APIRequestConvertible {
    let baseURL: String
    let path: String
    let httpMethod: String = "GET"
    let httpHeaderFields: [String: String]
    
    func urlRequest() throws -> URLRequest {
        guard let url = URL(string: baseURL + path) else {
            throw NetworkError.badURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.allHTTPHeaderFields = httpHeaderFields
        return request
    }
}
