//
//  Normalize.swift
//  Xiritori
//
//  Created by Gilberto Magno on 9/30/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

 // Normalize
class Normalize {
    let normalizar = Normalizar()

     init() {
do {
    try normalizar.generateFileNormalized()
} catch {
    return
}
    }
}
