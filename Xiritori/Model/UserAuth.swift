//
//  UserAuth.swift
//  Xiritori
//
//  Created by Elias Ferreira on 24/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

class UserAuth: Codable {
    let token: String
    let user: User
    
    init(token: String, user: User) {
        self.token = token
        self.user = user
    }
}
