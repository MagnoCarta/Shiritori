//
//  File.swift
//  Xiritori
//
//  Created by Elias Ferreira on 24/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

class User: Codable {
    let id: String
    let username: String
    let email: String
    let password: String
    let tag: Int
    
    init(
        id: String,
        username: String,
        email: String,
        password: String,
        tag: Int
    ) {
        self.id = id
        self.username = username
        self.email = email
        self.password = password
        self.tag = tag
    }
}
