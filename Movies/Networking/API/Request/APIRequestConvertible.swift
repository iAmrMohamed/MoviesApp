//
//  APIRequest.swift
//  Movies
//
//  Created by Amr Mohamed on 10/11/2023.
//

import Foundation

protocol APIRequestConvertible {
    var path: String { get }
    var baseURL: String { get }
    var httpMethod: String { get }
    var httpHeaderFields: [String: String] { get } 
    
    func urlRequest() throws -> URLRequest
}
