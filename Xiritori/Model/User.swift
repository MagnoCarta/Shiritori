//
//  File.swift
//  Xiritori
//
//  Created by Elias Ferreira on 24/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: String?
    let username: String
    let email: String
    let password: String
    
    init(
        username: String,
        email: String,
        password: String
    ) {
        self.id = nil
        self.username = username
        self.email = email
        self.password = password
    }
}
