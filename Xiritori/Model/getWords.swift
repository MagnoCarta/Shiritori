//
//  getWords.swift
//  Xiritori
//
//  Created by Gilberto Magno on 9/30/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//


import Foundation


let resultFileURL = playgroundSharedDataDirectory.appendingPathComponent("resultado_palavras.json")

let data = try Data(contentsOf: resultFileURL, options: .alwaysMapped)
let results = try JSONDecoder().decode([ResultWords].self, from: data)


if let startWith = results.first(where: {$0.firstCharacter == "A"}) {
    let randomWord = startWith.words[Int.random(in: 0..<startWith.words.count)]
    print(randomWord)
}

//: [Next](@next)
