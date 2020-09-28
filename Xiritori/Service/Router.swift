//
//  Router.swift
//  Xiritori
//
//  Created by Elias Ferreira on 28/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

enum Router {
    case create(body: Data?)
    case getAll
    case delete(id: String)
    
    var scheme: String {
        return "http"
    }
    
    var host: String {
        return "localhost:8080"
    }
    
    var path: String {
        switch self {
        case .create:
            return "/users"
        case .getAll:
            return "/users"
        case .delete(let id):
            return "/users/\(id)"
        }
    }
    
    var header: [String: String] {
        switch self {
        default:
            return [
                "Content-Type": "application/json"
            ]
        }
    }
    
    var body: Data? {
        switch self {
        case .create(let body):
            return body
        default:
            return nil
        }
    }
    
    var method: String {
        switch self {
        case .create:
            return "POST"
        case .getAll:
            return "GET"
        case .delete:
            return "DELETE"
        }
    }
    
    // URL
    var url: URL? {
        var components = URLComponents()
        components.scheme = self.scheme
        components.host = self.host
        components.path = self.path
        
        return components.url
    }
    
    // Request
    var urlRequest: URLRequest? {
        guard let url = self.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = self.method
        request.allHTTPHeaderFields = self.header
        request.httpBody = self.body
        
        return request
    }
}
