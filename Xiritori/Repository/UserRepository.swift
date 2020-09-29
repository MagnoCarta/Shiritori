//
//  UserRepository.swift
//  Xiritori
//
//  Created by Elias Ferreira on 24/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

class UserRepository {
    
    // Create User
    func create(userToSave: User, completion: @escaping (Session?) -> Void) {
        
        let userData = [
            "username": userToSave.username,
            "email": userToSave.email,
            "password": userToSave.password
        ]
        
        let data = try? JSONSerialization.data(withJSONObject: userData, options: [])

        Service.request(route: .create(body: data)) { (result) in
            switch result {
            case .success(let data):
                guard let data = data else { return }
                
                if let userJson = try? JSONDecoder().decode(Session.self, from: data) {
                    
                    completion(userJson)
                    
                }
                
            case .failure:
                completion(nil)
            }
        }
        
    }
    
    //Login
    func login(email: String, password: String, completion: @escaping (Session?) -> Void) {
        let loginString = String(format: "%@:%@", email, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        
        Service.request(route: .login(auth: base64LoginString)) { result in
            switch result {
            case .success(let data):
                guard let data = data else { return }
                
                if let userJson = try? JSONDecoder().decode(Session.self, from: data) {
                    
                    completion(userJson)
                    
                }
            case .failure:
                completion(nil)
            }
        }
    }
}
