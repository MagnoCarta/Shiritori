//
//  Message.swift
//  Xiritori
//
//  Created by Vinicius Mesquita on 08/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation
enum Sender {
    case me, enemy
}

struct Message {
    let text: String
    let from: Sender
}
