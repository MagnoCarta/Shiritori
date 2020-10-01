//
//  Word.swift
//  Xiritori
//
//  Created by Gilberto Magno on 9/30/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

public struct Word: Codable {
    public let word: String
    public let count: Int
    
    public init(word: String, count: Int) {
        self.word = word
        self.count = count
    }
}
