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
    case delete(uid: String)
    case login(auth: String)
    
    var baseUrl: String {
        return "http://127.0.0.1:8080"
    }
    
    var path: String {
        switch self {
        case .create:
            return "/users"
        case .getAll:
            return "/users"
        case .delete(let uid):
            return "/users/\(uid)"
        case .login:
            return "/users/login"
        }
    }
    
    var header: [String: String] {
        switch self {
        case .login(let auth):
            return [
                "Content-Type": "application/json",
                "Authorization": "Basic \(auth)"
            ]
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
        case .login:
            return "POST"
        }
    }
    
    // URL
    var url: URL? {
        let url: String = self.baseUrl + self.path
        return URL(string: url)
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
