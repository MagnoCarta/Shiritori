//
//  Error.swift
//  Xiritori
//
//  Created by Elias Ferreira on 24/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

class Error: Codable {
    let error: Bool
    let reason: String
    
    init(error: Bool, reason: String) {
        self.error = error
        self.reason = reason
    }
}
