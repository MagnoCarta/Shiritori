//
//  UserRepository.swift
//  Xiritori
//
//  Created by Elias Ferreira on 24/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

class UserRepository {
    
    var url = ""
    // Create User
    func create(username: String, email: String, password: String) {
        // Create URL
        let url = URL(string: "http://127.0.0.1:8080/users")
        // Create URLRequest
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json"
        ]
        
        let user = [
            "username": username,
            "email": email,
            "password": password
        ]
        
        do {
            let data = try JSONSerialization.data(withJSONObject: user, options: .fragmentsAllowed)
            request.httpBody = data
        } catch {
            print(error)
        }
        
        // Create Session
        let session = URLSession(configuration: .default)
        
        let getAnswerTask = session.dataTask(with: request) { (data, _, _) in
            if let data = data {
                if let answer = try? JSONDecoder().decode(UserAuth.self, from: data) {
                    print(answer)
                } else {
                    print("Erro no decode")
                    //completion([])
                }
            }
        }
        // Execute the task.
        getAnswerTask.resume()
    }
}
