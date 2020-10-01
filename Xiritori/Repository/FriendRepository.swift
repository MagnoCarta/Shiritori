//
//  FriendRepository.swift
//  Xiritori
//
//  Created by Elias Ferreira on 30/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

class FriendRepository {
    // List.
    func list(token: String, completion: @escaping ([Friend]?) -> Void) {
        Service.request(route: .friends(token: token)) { result in
            switch result {
            case .success(let data):
                guard let data = data else { return }
                
                if let userJson = try? JSONDecoder().decode([Friend].self, from: data) {
                    
                    completion(userJson)
                    
                }
            case .failure:
                completion(nil)
            }
        }
    }
    // Remove
    func remove(token: String, fid: String, completion: @escaping (Bool) -> Void) {
        Service.request(route: .removeFriend(token: token, fid: fid)) { result in
            switch result {
            case .success:
                completion(true)
            case .failure:
                completion(false)
            }
        }
    }
    
    // Remove
    func add(token: String, fid: String, completion: @escaping (Bool) -> Void) {
        Service.request(route: .addFriend(token: token, fid: fid)) { result in
            switch result {
            case .success:
                completion(true)
            case .failure:
                completion(false)
            }
        }
    }
}
