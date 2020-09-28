//
//  UserAuth.swift
//  Xiritori
//
//  Created by Elias Ferreira on 24/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

struct Session: Codable {
    let token: String
    let user: User
}
