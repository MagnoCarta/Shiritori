//
//  Service.swift
//  Xiritori
//
//  Created by Elias Ferreira on 28/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

struct Service {
    
    static func request(route: Router, completion: @escaping (Result<Data?, ServiceError>) -> Void) {
        guard let request = route.urlRequest else {
            let url = try? String(contentsOf: route.url!)
            completion(.failure(.malformedURLRequest(url: url!)))
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(.requestFailed(description: String(error.localizedDescription))))
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            switch response.statusCode {
            case 200:
                completion(.success(data))
            default:
                completion(.failure(.badRequest))
                print(response.statusCode)
            }
        }
        
        dataTask.resume()
    }
}
