//
//  WordResult.swift
//  Xiritori
//
//  Created by Gilberto Magno on 9/30/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

public struct ResultWords: Codable {
    public var firstCharacter: String = ""
    public var words: [Word] = []
    
    public init() {}
}
