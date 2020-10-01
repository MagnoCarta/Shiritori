//
//  TestJson.swift
//  Xiritori
//
//  Created by Gilberto Magno on 9/30/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

class TestJson {
    let resultFileURL = Normalizar().playgroundSharedDatDirectory.appendingPathComponent("resultado_palavras.json")

    var data: Data { get {do { return try Data(contentsOf: resultFileURL, options: .alwaysMapped)} catch {return Data()} } }
    var results: [ResultWords] { get {do { return try JSONDecoder().decode([ResultWords].self, from: data)} catch {return []} } }

    init() {
if let startWith = results.first(where: {$0.firstCharacter == "A"}) {
    let randomWord = startWith.words[Int.random(in: 0..<startWith.words.count)]
    print(randomWord)
    UserDefaults.standard.setValue(randomWord.word, forKey: "randomWord")
}
    }
}
