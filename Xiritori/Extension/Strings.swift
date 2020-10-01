//
//  Strings.swift
//  Xiritori
//
//  Created by Gilberto Magno on 9/30/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

extension StringProtocol {
        func indices<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Index]
        {
             var indices: [Index] = []
             var startIndex = self.startIndex
             while startIndex < endIndex,
             let range = self[startIndex...]
              .range(of: string, options: options) {
            
            indices.append(range.lowerBound)
            startIndex = range.lowerBound < range.upperBound ? range.upperBound : index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
              }
               return indices
                }
                  }
extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }

    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
         return String(self[start...])
    }
}
