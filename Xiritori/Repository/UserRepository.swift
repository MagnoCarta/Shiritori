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
    func create(userToSave: User) -> User? {
        
        var user: User? = nil
        
        guard let data = try? JSONEncoder().encode(userToSave) else { return nil }

        Service.request(route: .create(body: data)) { (result) in
            switch result {
            case .success(let data):
                guard let data = data else { return }
                
                if let userJson = try? JSONDecoder().decode(User.self, from: data) {
                    user = userJson
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
        return user
    }
}
